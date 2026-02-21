import UIKit

func maxProfit(_ prices: [Int]) -> Int {
  var start = 0
  var end = prices.count - 1

  var maxProfit = 0

  while start < end {
    let profit = prices[end] - prices[start]
    
    if profit > maxProfit {
      maxProfit = profit
    }
    
    if profit < 0 {
      start += 1
    } else {
      end -= 1
    }
  }
  
  return maxProfit
}


let result = maxProfit([7,6,5,4,3])
print(result)
