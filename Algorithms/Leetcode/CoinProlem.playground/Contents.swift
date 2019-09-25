import Cocoa

var d = [Int](repeating: 0, count: 30)
var e = [Int](repeating: 0, count: 30)
func findCoin(x: Int, coins: [Int]) {

  for i in 1...x {
    d[i] = Int.max

    for coin in coins {
      if (i - coin) < 0 { continue }
      let u = d[i-coin] + 1

      if ( u < d[i]) {
        d[i] = u
        e[i] = coin
      }
    }
  }
}

var x = 20
findCoin(x: x, coins: [1, 4, 5])

while x > 0 {
  print(e[x])
  x -= e[x]
}

