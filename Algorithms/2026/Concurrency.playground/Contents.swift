import UIKit


class Counter {
  var value = 0
  let lock = NSLock()
  let semaphore = DispatchSemaphore(value: 1)
  let queue = DispatchQueue(label: "com.example.serialQueue")

  func increment() {
    value += 1
  }
  
  func incrementWithLock() {
    lock.lock()
    value += 1
    lock.unlock()
  }
  
  func incrementWithSemaphore() {
    semaphore.wait()
    value += 1
    semaphore.signal()
  }
  
  func incrementWithSerialQueue() {
    queue.sync {
      self.value += 1
    }
  }
}


// Race condition
let counter = Counter()
DispatchQueue.concurrentPerform(iterations: 1000) { _ in
//  counter.increment()
  counter.incrementWithSerialQueue()
}

print(counter.value)


// Synchronisation


actor DataStore<Key: Hashable, Value> {
  private var storage: [Key: Value] = [:]
  
  func read(key: Key) -> Value? {
    return storage[key]
  }
  
  func write(key: Key, value: Value) {
    storage[key] = value
  }
  
  // Delete
  func delete(key: Key) {
    storage.removeValue(forKey: key)
  }
  
  // Bulk read snapshot
  var allValues: [Key: Value] {
    storage
  }
}

// Swift concurrency
func readWrite() {
  let store = DataStore<String, Int>()
  
  Task { await store.write(key: "score", value: 100) }
  Task {
    let score = await store.read(key: "score")
    print(score ?? 0)
  }
}

// Re-entrancy
// When an actor function hits an await, it may suspend, allowing other tasks waiting on that actor to run first.
// This is called reentrancy — it improves responsiveness without violating isolation.
actor Inventory {
  private var stock: [String: Int] = ["book": 1]
  
  func chargeUser() async throws {}
  
  enum StockError: Error {
    case outOfStock
  }
  
  func reserve(item: String) async throws {
    guard let qty = stock[item], qty > 0 else { throw  StockError.outOfStock}
    try await chargeUser()      // suspension point
    guard let updated = stock[item], updated > 0 else {
      throw StockError.outOfStock
    }
    stock[item] = updated - 1
  }
}

// https://anubhavgiri01.medium.com/concurrency-in-ios-part-2-b-actors-isolation-in-swift-concurrency-ec2d567118dc
import Foundation
import os

struct User: Sendable {
  let id: Int
  let name: String
}

final class MutableBox<T> {
  var value: T
  
  init(value: T) {
    self.value = value
  }
}

final class SafeBox<T: Sendable>: @unchecked Sendable {
  private let lock = OSAllocatedUnfairLock()
  private var _value: T
  
  init(_ v: T) {
    _value = v
  }
  
  var value: T {
    get {
      lock.withLock {
        _value
      }
    }
    set { lock.withLock { _value = newValue } }
  }
}

func fetchProfile(_ id: Int) async throws -> User {
  return User(id: 1, name: "")
}

func fetchProfiles(_ ids: [Int]) async throws -> [User] {
  try await withThrowingTaskGroup(of: User.self) { group in
    for id in ids {
      group.addTask {
        try await fetchProfile(id)
      }
    }
    
    var result: [User] = []
    for try await user in group {
      result.append(user)
    }
    return result
  }
}
