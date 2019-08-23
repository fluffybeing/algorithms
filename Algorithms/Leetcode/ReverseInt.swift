// import Foundation

func reverse(_ x: Int) -> Int {
  var reverseInt = 0
  var x = x

  while(abs(x) > 0) {
    reverseInt *= 10
    reverseInt += (x % 10)
    x = Int(x / 10)
  }

  guard reverseInt > (-2 << 31) && reverseInt < (2 << 31) - 1 else {
    return 0
  }

  return reverseInt
}


