
import Foundation

func findComplement(_ num: Int) -> Int {
  let binary = String(num, radix: 2)

  let complement = binary.map {$0 == Character("1") ? Character("0") : Character("1")}
  return Int(String(complement), radix: 2) ?? 0
}

func testFindComplement() {
  let result = findComplement(5)
  print(result)
}
