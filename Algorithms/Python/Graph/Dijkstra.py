#!/usr/bin/python

import sys
import heapq

def dijkstra(s, g):
	v = {k: 0 for k in g}
	e = {k: sys.maxint for k in g}
	e[s] = 0
	q = [(0, s)]
		
	while (q != []):
		_, a = heapq.heappop(q)
		
		if v[a]: continue;
		v[a] = 1
		
		for (n, w) in g[a]:
			if (e[a] + w < e[n]):
				e[n] = e[a] + w
				heapq.heappush(q, (e[n], n)) 
	
	return e
	
def testDijkstraShortestPath():
	graph = {
		1: [(4, 9), (5, 1), (2, 5)],
		2: [(5, 3)],
		3: [(2, 2)],
		4: [(3, 6)],
		5: [(4, 2)]
	}
	
	e = dijkstra(1, graph)
	print(e)

testDijkstraShortestPath()