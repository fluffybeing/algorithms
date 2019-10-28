#!/usr/bin/python

def nextPermutation(A):
	suffixs = None
	suffixStartIndex = None
	for index in range(len(A) - 1):
		if A[index] > A[index + 1]:
			suffixs = A[index:]
			suffixStartIndex = index 
			break
	if suffixs is None and len(A) > 1:
		suffixs = A[-1:]
		suffixStartIndex = len(A) - 1
	
	prefixs = A[: suffixStartIndex]
	prefixLastElement = prefixs.pop() if len(prefixs) >= 1 else 
	
	# reverse the suffix
	suffixLastElement = suffixs.pop() if len(suffixs) >= 1 else []
	suffixs.reverse()
		
	nextPermute = prefixs + [suffixLastElement] + [prefixLastElement] + suffixs 
	return nextPermute

r = nextPermutation([1])	
print(r)
