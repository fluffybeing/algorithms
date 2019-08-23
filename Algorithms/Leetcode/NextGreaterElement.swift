import Foundation

func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
	
	var findNums = findNums
	let numsCount = nums.count
	
	for (index, value) in findNums.enumerated() {
		if let i = nums.firstIndex(of: value) {
			let rightElementIndex = i + 1 
			
			if rightElementIndex < numsCount {
				let slice = Array(nums[rightElementIndex..<numsCount])
				if let elementIndex = slice.firstIndex(where: {$0 > value}) {
					findNums[index] = slice[elementIndex]
				} else {
					findNums[index] = -1
				}
			} else {
				findNums[index] = -1
			} 
		}	
	}	
	return findNums
}

func testNextGreaterElement() {

  let result = nextGreaterElement([4,1,2], [1,3,4,2])
  // [7,7,7,7,7]
  print(result)
}
