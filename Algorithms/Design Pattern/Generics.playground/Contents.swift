import Cocoa

protocol Request {
  associatedtype Response = Decodable

  var headers: [String: String] { get }
}


// Base class Mocking the protocol

private class _AnyRequest<Response>: Request {

  var headers: [String : String] {
    return [:]
  }

  init() {
    // This class should not be initialised
    guard type(of: self) != _AnyRequest.self else {
      fatalError("Cannot initialise; need to subclass")
    }
  }
}



class MyRequest<T>: Request {
  var headers: [String : String] {
    return [:]
  }

//  let name: T
//
//  init(name: T) {
//    self.name = name
//  }
}

let r: MyRequest<String>  = MyRequest()

