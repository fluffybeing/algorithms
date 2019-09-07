import Cocoa

class MemoryLeak {
  weak var ref: MemoryLeak?
  init(ref: MemoryLeak) {
    self.ref = ref
  }
  init() {
    ref = self
  }
}

func test() -> MemoryLeak {
  let a = MemoryLeak()
  let b = MemoryLeak(ref: a)
  let c = MemoryLeak(ref: b)
  a.ref = c
  return a
}

let result = test()
assert(result.ref != nil)
