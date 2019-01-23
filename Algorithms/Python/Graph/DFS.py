#!/usr/bin/python3


def DFSUtil(s, g, v, p):
	if v[s]: return
	
	v[s] = 1
	p.append(s)
	
	for n in g[s]:
		if v[n] == 0:
			DFSUtil(n, g, v, p)
	
def DFS(source, graph):
	v = { k:0 for k in graph.keys() }
	path = list()
	DFSUtil(source, graph, v, path)
	return path
	
def testDFS():
	graph = {
		1: [2, 4],
		2: [3, 1, 5],
		3: [2, 5],
		5: [2, 3],
		4: [1]
	}
	
	path = DFS(1, graph)
	print(path)

if __name__ == "__main__":
	testDFS()