import UIKit
import os
import XCTest


func listPhotos(inGallery name: String) async throws -> [String] {
  try await Task.sleep(for: .seconds(2))
  return []
}

func fileHandler() async throws {
  let handle = FileHandle.standardInput
  for try await line in handle.bytes.lines {
    print(line)
  }
}



class SafeBox<T: Sendable>: @unchecked Sendable {
  private let lock = OSAllocatedUnfairLock()
  private var _value: T
  
  init(_ value: T) {
    self._value = value
  }
  
  var value: T {
    get {
      lock.withLock {
        _value
      }
    }
    
    set {
      lock.withLock {
        _value = newValue
      }
    }
  }
}

func multiTask() {
  let group = DispatchGroup()
  
  group.enter()
  DispatchQueue.global().async {
    print("GCD - Task 1 started")
    sleep(1)
    print("GCD - Task 1 done")
    group.leave()
  }
  
  DispatchQueue.global().async() {
    print("GCD - Task 2 started")
    sleep(1)
    print("GCD - Task 2 done")
    group.leave()
  }
  
  group.notify(queue: .main) {
    print("all tasks done")
  }
}

func multiTaskWithSemaphore() {
  let semaphore = DispatchSemaphore(value: 0)
  var text = ""
  
  DispatchQueue.global().async {
    var localText = ""
    for i in 0...5 {
      localText.append("\(i)")
      semaphore.signal()
    }
    
    semaphore.wait()
    
    for i in 0...5 {
      localText.append("\(i)")
      semaphore.signal()
    }
    
    semaphore.wait()
  }
  
  
}

func performSeveralTask() async {
  await withTaskGroup(of: Void.self) { group in
    group.addTask {
      print("Task 1 started")
      try? await Task.sleep(nanoseconds: 1_000_000_000)
      print("Async task done")
    }
    
    group.addTask {
      print("Task 2 started")
      try? await Task.sleep(nanoseconds: 1_0000_0000_0000)
      print("Async task done")
    }
    
    print("Both task is finished")
  }
}

func fetchNews() async -> Data? {
  do {
    let url = URL(string: "https://hws.dev/news-1.json")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
  } catch {
    print("Failed to fetch the news")
    return nil
  }
}

func runNews() {
  Task {
    if let data = await fetchNews() {
      print("News: \(data)")
    }
  }
}

func fetchFavorites() async throws -> [Int] {
  let url = URL(string: "https://hws.dev/user-favorites.json")
  let (data, _) = try await URLSession.shared.data(from: url!)
  return try JSONDecoder().decode([Int].self, from: data)
}


func loadUserMessage() async {
  async let (user, _) = URLSession.shared.data(from: URL(string: "https")!)
  async let (message, _) = URLSession.shared.data(from: URL(string: "https")!)
  
  do {
    let decoder = JSONDecoder()
    let user = try await decoder.decode([Int].self, from: user)
    let messages = try await decoder.decode([String].self, from: message)
  } catch {
    print("Sorry can't get the data")
  }
}

func fetchMessages(completion: @Sendable @escaping ([Int]) -> Void) {
  let url = URL(string: "https://hws.dev/user-messages.json")!
  
  URLSession.shared.dataTask(with: url) { data, response, error in
    if let data = data {
      do {
        let messages: [Int] = try JSONDecoder().decode([Int].self, from: data)
        completion(messages)
      } catch {
        print("Failed to decode the data")
      }
    }
    
    completion([])
  }.resume()
}

func fetchMessages() async -> [Int] {
  await withCheckedContinuation { continuation in
    fetchMessages() { messages in
      continuation.resume(returning: messages)
    }
  }
}

func printUsers() async throws {
  let url = URL(string: "https://hws.dev/users.csv")!
  
  var iterator = url.lines.makeAsyncIterator()
  
  if let line = try await iterator.next() {
    print("The first user is \(line)")
  }
  
  for i in 2...5 {
    if let line = try await iterator.next() {
      print("User #\(i): \(line)")
    }
  }
  
  var remainingResults = [String]()
  
  while let result = try await iterator.next() {
    remainingResults.append(result)
  }
}
