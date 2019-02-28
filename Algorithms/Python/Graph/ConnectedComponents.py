#!/usr/bin/python3

from DFS import DFS

def isAlreadyVisited(n, cc):
	for c in cc:
		if n in c:
			return True
		else:
			return False

def connectedComponent(g):
	nodes = g.keys()
	cc = []
	for n in nodes:
		if not isAlreadyVisited(n, cc):
			c = DFS(n, g)
			cc.append(c)
	return cc			

def testConnectedComponent():
	graph = {
		1: [3, 4],
		2: [5],
		3: [1, 4],
		5: [2],
		4: [1, 3]
	}
	cc = connectedComponent(graph)
	print(cc)

if __name__ == "__main__":
	testConnectedComponent()