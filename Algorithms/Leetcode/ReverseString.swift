import Foundation

func reverseString(_ s: String) -> String {
	
	var s = Array(s)
	let sLength = s.count
	
	for index in 0..<sLength / 2 {
    s.swapAt(index, sLength - (index + 1))
	}		
	
	return String(s)
}

func testReverseString() {
  let result = reverseString("money")
  print(result)
}
