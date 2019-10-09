import Cocoa

// Race Conditions
// Resource Contention
// Deadlocks
// Starvation
// Priority Inversion
// Non-Determininsm and Fairness

// Global variables initialised atomic
// Access to class prop and lazy instance


class MyThread: Thread {
  override func main() {
    print("Thread Started")
    Thread.sleep(forTimeInterval: 2)
    print("Done sleeping")
  }
}

//MyThread().start()
//
//var t = Thread {
//  print("Started")
//}
//
//t.stackSize =  1024 * 16
//t.start()

// Synchronisation

// NSLock one thread at a time
// Unfair
// More thread, more time
// user lock inside data structure

let lock = NSLock()

class LThread: Thread {
  var id: Int = 0

  convenience init(id: Int) {
    self.init()
    self.id = id
  }

  override func main() {
    lock.lock()
    print(String(id))
    lock.unlock()

    if lock.try() {
      print("again acquired")
      lock.unlock()
    } else {
      print("Not Acquired")
    }
    print(id)
  }
}

//var t1 = LThread(id: 1)
//var t2 = LThread(id: 2)
//t1.start()
//t2.start()
//

// Recursive lock
let rlock = NSRecursiveLock()

class RThread : Thread {

  override func main(){
    rlock.lock()
    print("Thread acquired lock")
    callMe()
    rlock.unlock()
    print("Exiting main")
  }

  func callMe(){
    rlock.lock()
    print("Thread acquired lock")
    rlock.unlock()
    print("Exiting callMe")
  }
}


//var tr = RThread()
//tr.start()


let NO_DATA = 1
let GOT_DATA = 2
let clock = NSConditionLock(condition: NO_DATA)
var sharedInt = 0

class ProducerThread: Thread {
  override func main() {
    for i in 0..<5 {
      clock.lock(whenCondition: NO_DATA)
      sharedInt = i
      clock.unlock(withCondition: GOT_DATA)
    }
  }
}

class ConsumerThread : Thread {

  override func main(){
    for i in 0..<5 {
      clock.lock(whenCondition: GOT_DATA) //Acquire the lock when GOT_DATA
      print(i)
      clock.unlock(withCondition: NO_DATA) //Unlock and set as NO_DATA
    }
  }
}

//let pt = ProducerThread()
//let ct = ConsumerThread()
//ct.start()
//pt.start()

// NSCondition provides a clean way to wait for something.

let cond = NSCondition()
var available = false
var SharedString = ""

class WriterThread : Thread {

  override func main(){
    for _ in 0..<5 {
      cond.lock()
      SharedString = "😅"
      available = true
      cond.signal() // Notify and wake up the waiting thread/s
      cond.unlock()
    }
  }
}

class PrinterThread : Thread {

  override func main(){
    for _ in 0..<5 { //Just do it 5 times
      cond.lock()
      while(!available){   //Protect from spurious signals
        cond.wait()
      }
      print(SharedString)
      SharedString = ""
      available = false
      cond.unlock()
    }
  }
}

//let writet = WriterThread()
//let printt = PrinterThread()
//printt.start()
//writet.start()

//On Synchronized Blocks
//In Swift you can’t create a @synchronized block out of the box as you would do in Objective-C, since there is no equivalent keyword available.
var v = 0
let serialQueue = DispatchQueue(label: "com.concurrency")
//serialQueue.sync {
//  // Only a thread at a time!
//  v += 1
//  print("Current value \(v)")
//}


// GCD
let concurrentQueue = DispatchQueue(label: "com.grab.Concurrent1", attributes: .concurrent)
let globalDefault = DispatchQueue.global()

//globalDefault.async {
//  print("Async on MainQ, first?")
//}
//
//globalDefault.sync {
//  print("Sync in MainQ, second?")
//}
//

// Perform several times
//globalDefault.sync {
//  DispatchQueue.concurrentPerform(iterations: 5) {
//    print("\($0) times")
//  }
//}

//DispatchQueue.concurrentPerform(iterations: 5) {
//  print("\($0) times")
//}

// Activate Queue later
//let inactiveQueue = DispatchQueue(label: "com.uraimo.inactiveQueue", attributes: [.concurrent, .initiallyInactive])
//inactiveQueue.async {
//  print("Done!")
//}
//
//print("Not yet...")
//inactiveQueue.activate()
//print("Gone!")
//
//
//concurrentQueue.async {
//  DispatchQueue.concurrentPerform(iterations: 5) { (id:Int) in
//    sleep(1)
//    print("Async on concurrentQueue, 5 times: "+String(id))
//  }
//}
//
//concurrentQueue.async (flags: .barrier) {
//  print("All 5 concurrent tasks completed")
//}

let mygroup = DispatchGroup()

for i in 0..<5 {
  globalDefault.async(group: mygroup){
    sleep(UInt32(i))
    print("Group async on globalDefault:"+String(i))
  }
}

mygroup.notify(queue: globalDefault) {
  print("Done!")
}
