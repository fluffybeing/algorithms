import Foundation

func distributeCandies(_ candies: [Int]) -> Int {
	var candySet = Set<Int>()
	
	for candy in candies {
		candySet.insert(candy)
	}
	let uniqueCandyCount = candySet.count
	let upperCandyCountLimit = candies.count / 2
	if uniqueCandyCount < upperCandyCountLimit  {
		return uniqueCandyCount
	}
	return upperCandyCountLimit
}

let result = distributeCandies([1, 1, 2, 2])
print(result)