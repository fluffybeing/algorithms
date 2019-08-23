
import Foundation

func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
	let row = nums.count
	let column = nums[0].count
	
	if row * column == r * c {
		// convert to one dimensional array
		var oneD = nums.reduce([], +)

		var twoD = [[Int]]()
		for i in 0..<r {
			var temp = [Int]()
			for j in 0..<c {
				temp.append(oneD[i * c + j])
			}
			twoD.append(temp)	
		}
		return twoD
	}
	return nums
}

func testMatrixReshape() {
  let result = matrixReshape([[1, 2], [3, 4]], 2, 2)
  print(result)
}
