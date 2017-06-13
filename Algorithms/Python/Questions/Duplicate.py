#!/usr/bin/python

def duplicate_number(A):
		
	for index, elem in enumerate(A):
		if A[index] >= 0:
			A[abs(elem)] = -A[abs(elem)]
		else:
			print(abs(elem))
	
	

duplicate_number([1, 2, 3, 1, 3, 6, 6])
			
		