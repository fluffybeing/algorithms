#!/usr/bin/python3

class Solution:
	# @param A : tuple of list of integers
	# @return a list of integers
	def spiralOrder(self, A):
		result = []
		
		for index, l in enumerate(A):
			listToAdd = l if index % 2 == 0 else l[::-1]
			result.extend(listToAdd)
		
		result = ' '.join(map(str, result))
		
		return result

test = Solution()
r = test.spiralOrder(([1, 2], [2, 3], [3]))
print(r)

