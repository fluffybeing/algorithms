import Foundation


func findUnsortedSubarray(_ nums: [Int]) -> Int {
	
	var range:(Int, Int) = (0, 0)
	let totalCount = nums.count
	for index in 0..<totalCount - 1 {
		if nums[index + 1] <= nums[index] {
			range.0 = index
			break
		}
	}
	
	for index in (1..<totalCount).reversed() {
		if nums[index] < nums[index - 1]{
			range.1 = nums[index - 1] > nums[totalCount - 1] ? totalCount - 1 : index
			break
		}
	}	
	
	if range.1 == 0 {
		return 0
	}
	print(range)
	return (range.1 - range.0) + 1	
}

let result = findUnsortedSubarray([1,2,4,5,3])
//[1,2,3,3,3]
print(result)