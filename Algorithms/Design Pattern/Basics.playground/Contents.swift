import Cocoa
import PlaygroundSupport

enum State<T> where T: Equatable {
  case on
  case off
  case dimmed(T)
}

enum LightLevel: String {
  case quarter
  case half
  case threequarters
}

let state: State<LightLevel> = .dimmed(.half)


let runMe = { () -> Int in
  print("running")
  return 0
}

runMe()

class MyClass {
  var running = false
  var dispatch =  { print("Hello") }

  func run() {
    // create cycle if you have reference to the block
    dispatch = { [weak self] in print("\(self!.running)") }

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
      self.running = true
      print(self.running)
    }
  }

  deinit {
    print("Hello!")
    print(running)
  }
}

var my: MyClass? = MyClass()
my?.run()
my = nil

PlaygroundPage.current.needsIndefiniteExecution = true
