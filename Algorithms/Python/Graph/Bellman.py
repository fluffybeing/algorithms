#!/usr/bin/python

import sys

# Check for directed graph
def bellman(s, g):
	# infinity weight
	e = {k:sys.maxsize for k in g.keys()}
	e[s] = 0
	
	# n-1 times because a graph will have
	# n-1 edges at max without cycle
	for i in range(len(g) - 1):
		for k in g:
			for (n, w) in g[k]:
				e[n] = min(e[n], e[k] + w)
	return e
				

def testBellmanshortestPath():
	graph = {
		1: [(2, 2), (3, 3), (4, 7)],
		2: [(5, 3)],
		3: [(4, -2)],
		4: [(5, 2)],
		5: []
	}
	
	e = bellman(1, graph)
	print(e)
	

testBellmanshortestPath()