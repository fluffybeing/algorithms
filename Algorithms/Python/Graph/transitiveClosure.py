

def DFS(g, s, v, tc):
	tc[s][v] = 1

	for i in g[v]:
		if not tc[s][i]:
			DFS(g, s, i, tc)


def transitiveClousre(g, tc):
	
	for i in range(len(g.keys())):
		DFS(g, i, i, tc)

	return tc 

	
def testTransitiveClosure():
	graph = {
		0: [1, 2],
		1: [2],
		2: [0, 3],
		3: [3]
	}
	
	tc = [[0 for _ in graph] for _ in graph]
	mat = transitiveClousre(graph, tc)
	print(mat)

if __name__ == "__main__":
	testTransitiveClosure()
