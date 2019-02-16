#!/usr/bin/python3

c = {}
t = {
	1: [4, 5, 2],
	2: [1, 6],
	3: [4],
	4: [3, 7],
	5: [1],
	6: [2],
	7: [4]
}

# Dynamic programming implementation of finding
# subtree count

def dfs(s, e):
	c[s] = 1

	for node in t[s]:
		if (node != e): 
			dfs(node, s)
			c[s] += c[node]


dfs(1, 0)
print(c)
