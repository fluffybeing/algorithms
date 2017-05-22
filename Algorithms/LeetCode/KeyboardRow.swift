import Foundation

func isWordInKeyboardRow(_ word: String) -> Bool {
	
	let topLetters = "qwertyuiop"
	let middleLetters = "asdfghjkl"
	let lowerLetters = "zxcvbnm"
	
	var countTop = 0
	var countMiddle = 0
	var countLower = 0
	for char in word.lowercased().characters {
		if topLetters.characters.contains(char) {
			countTop += 1
		} else if middleLetters.characters.contains(char) {
			countMiddle += 1
		} else if lowerLetters.characters.contains(char) {
			countLower += 1
		}	
	}
	
	let wordCount = word.characters.count
	if (countTop == wordCount) || (countMiddle == wordCount) || (countLower == wordCount) {
		return true
	}
	
	return false
}

func findWords(_ words: [String]) -> [String] {
	
	var wordInRow = [String]()
	
	for word in words {
		if isWordInKeyboardRow(word) {
			wordInRow.append(word)
		}
	}
	
	return wordInRow
}

let result = findWords(["Hello", "Alaska", "Dad", "Peace"])
print(result) 
