//
//  NetworkService.swift
//  
//
//  Created by Ranjan, Rahul on 3/16/26.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case decodingError
  case serverError(statusCode: Int)
  case unknown(Error)
}

enum HTTPMethod: String {
  case GET
  case POST
  case PUT
  case DELETE
}

enum Endpoint {
  case users
  case posts
  case comments(postId: Int)
  
  var path: String {
    switch self {
      case .users: return "/users"
      case .posts: return "/posts"
      case .comments(let postId): return "/posts/\(postId)/comments"
    }
  }
}

protocol APIRequest {
  associatedtype Response: Decodable
  var endpoint: Endpoint { get }
  var httpMethod: HTTPMethod { get }
}

extension APIRequest {
  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "jsonplaceholder.typicode.com"
    components.path = endpoint.path
    return components.url
  }
}

struct GetUserRequest: APIRequest {
  typealias Response = [String]
  let endpoint: Endpoint = .users
  let httpMethod: HTTPMethod = .GET
  
}

final class NetworkKit {
  func fetch<T: APIRequest>(_ request: T) async throws -> T.Response {
    guard let url = request.url else {
      throw NetworkError.invalidURL
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = request.httpMethod.rawValue

    let (data, response): (Data, URLResponse)
    do {
      (data, response) = try await URLSession.shared.data(for: urlRequest)
    } catch {
      throw NetworkError.unknown(error)
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.unknown(NSError(domain: "Invalid response", code: 0))
    }
    
    guard (200..<300).contains(httpResponse.statusCode) else {
      throw NetworkError.serverError(statusCode: httpResponse.statusCode)
    }

    do {
      return try JSONDecoder().decode(T.Response.self, from: data)
    } catch {
      throw NetworkError.decodingError
    }
  }
}



// Go with this solution in the test
// https://archive.is/20250729132544/https://swift-pal.com/urlsession-in-swift-build-a-clean-and-testable-networking-layer-261f96a3df63
//
protocol NetworkClient {
  func send<T: Decodable>(_ request: URLRequest) async throws -> T
}

extension NetworkClient {
  func sendWithRetry<T: Decodable>(
    _ request: URLRequest,
    retries: Int = 2,
    delay: TimeInterval = 1
  ) async throws -> T {
    var lastError: Error?
    for attempt in 0...retries {
      do {
        return try await send(request)
      } catch {
        lastError = error
        try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
      }
    }
    throw lastError ?? NetworkError.unknown(NSError(domain: "Invalid response", code: 0))
  }
}


final class URLSessionNetworkClient: NetworkClient {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func send<T: Decodable>(_ request: URLRequest) async throws -> T {
    let (data, response) = try await session.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode else {
      throw NetworkError.unknown(NSError(domain: "Invalid response", code: 0))
    }
    
    do {
      return try JSONDecoder().decode(T.self, from: data)
    } catch {
      throw NetworkError.decodingError
  
  }
}



class UserService {
  private let networkClient: NetworkClient
  
  init(networkClient: NetworkClient) {
    self.networkClient = networkClient
  }
  
  func fetchUsers() async throws -> [String] {
    let url = URL(string: "https://api.example.com/users")!
    let request = URLRequest(url: url)
    return try await networkClient.send(request)
  }
}
