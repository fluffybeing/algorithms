#!/usr/bin/python3 

t = {
	1: [4, 5, 2],
	2: [1, 6],
	3: [4],
	4: [3, 7],
	5: [1],
	6: [2],
	7: [4, 8],
	8: [7]
}

def height(s, e):
	count = 0
	for node in t[s]:
		if node != e: 
			print(node, s)
			height(node, s) 

print(height(1, 0))
