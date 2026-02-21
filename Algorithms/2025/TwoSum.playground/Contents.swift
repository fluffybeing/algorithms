import UIKit

func twoSum(target: Int, numbers: [Int]) -> [Int] {
  guard numbers.count > 1 else { return [] }

  let numbersSet = Set(numbers)

  for num in numbers {
    let anotherNumber = target - num

    if numbersSet.contains(anotherNumber) {
      return [num, anotherNumber]
    }
  }

  return []
}

func twoSumIndex(target: Int, nums: [Int]) -> [Int] {
  guard nums.count > 1 else { return [] }

  var dict = [Int: Int]()

  for (i, num) in nums.enumerated() {
    let anotherNumber = target - num
    
    print(dict)
    if let index = dict[anotherNumber] {
      return [i, index]
    }
    dict[num] = i
    print(dict)
  }

  return []
}

let result = twoSumIndex(target: 10, nums: [2, 6, 7, 5])
print(result)
print("Hello")
