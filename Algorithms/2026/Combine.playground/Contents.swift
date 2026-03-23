import UIKit
import Combine

let y = Just(5)
  .map { value -> String in
      return "a string"
  }
  .sink { receivedValue in
    print("the end result was \(receivedValue)")
  }


let x = PassthroughSubject<String, Never>()
  .flatMap { name in
    return Future<String, Error> { promise in
      promise(.success(""))
    }.catch { _ in
      Just("No user found")
    }.map { result in
        return "\(result) foo"
    }
  }


let cancellablePipeline = Just(5)
  .sink(receiveCompletion: { completion in
    switch completion {
      case .finished:
        break
      case .failure(let anError):
        print("received error \(anError)")
    }
  }, receiveValue: { someValue in
    print("value \(someValue)")
  })


let myURL = URL(string: "https://postman-echo.com/time/valid?timestamp=2016-10-10")

struct PostmanEchoTimeStampCheckResponse: Decodable, Hashable {
  let valid: Bool
}

let remoteDataPublisher = URLSession.shared.dataTaskPublisher(for: myURL!)
  .map { $0.data }
  .decode(type: PostmanEchoTimeStampCheckResponse.self, decoder: JSONDecoder())

let cancellableSink = remoteDataPublisher
  .sink(receiveCompletion: { completion in
    print(".sink()....", String(describing: completion))
    switch completion {
      case .finished:
        break
      case .failure(let anError):
        print("received error", anError)
    }
  }, receiveValue: { someValue in
    print("data ...\(someValue)")
  })

enum APIError: Error, LocalizedError {
case unknown, apiError(reason: String), parserError(reason: String), networkError(from: URLError)
  
  var errorDescription: String? {
    switch self {
      case .unknown:
        return "Unknown error"
      case .apiError(let reason), .parserError(let reason):
        return reason
      case .networkError(let from):
        return from.localizedDescription
    }
  }
}

func fetch(url: URL) -> AnyPublisher<Data, APIError> {
  let request = URLRequest(url: url)
  
  return URLSession.DataTaskPublisher(request: request, session: .shared)
    .tryMap { data, response in
      guard let httpResponse = response as? HTTPURLResponse else {
        throw APIError.unknown
      }
      if (httpResponse.statusCode == 401) {
        throw APIError.apiError(reason: "Unauthorized");
      }
      if (httpResponse.statusCode == 403) {
        throw APIError.apiError(reason: "Resource forbidden");
      }
      if (httpResponse.statusCode == 404) {
        throw APIError.apiError(reason: "Resource not found");
      }
      if (405..<500 ~= httpResponse.statusCode) {
        throw APIError.apiError(reason: "client error");
      }
      if (500..<600 ~= httpResponse.statusCode) {
        throw APIError.apiError(reason: "server error");
      }
      return data
    }
    .mapError { error in
      // if it's our kind of error already, we can return it directly
      if let error = error as? APIError {
        return error
      }
      
      // if all else fails, return the unknown error condition
      return APIError.unknown
    }
    .eraseToAnyPublisher()
}

