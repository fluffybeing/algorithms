import Foundation

func reverseString(_ s: String) -> String {
	
	var s = Array(s.characters)
	let sLength = s.count
	
	for index in 0..<sLength / 2 {
		swap(&s[index], &s[sLength - (index + 1)])
	}		
	
	return String(s)
}

let result = reverseString("money")
print(result)