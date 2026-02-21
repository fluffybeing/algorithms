import UIKit


// If my current profit is greater than maxProfit
// then I will advance the buying time as I want to
// check if that will increase the profit
// if not, then I will decrease the selling time
func maxProfit(prices: [Int]) -> Int {
  var start = 0
  var end = prices.count - 1
  
  var maxProfit = 0
  
  while start < end {
    let currentProfit = prices[end] - prices[start]

    maxProfit = max(maxProfit, currentProfit)
    
    if currentProfit < 0 {
      end -= 1
    } else {
      start += 1
    }
  }
  return maxProfit
}

let prices = [6,1,3,2,4,7]

print(maxProfit(prices: prices))
