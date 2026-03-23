import UIKit

func productArray(_ nums: [Int]) -> [Int] {
  
  var products = [Int]()
  var curr = 1
  for (index, num) in nums.enumerated() {
    products[index] *= curr
    curr *= num
  }
  
  return products
}
