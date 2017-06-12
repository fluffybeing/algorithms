#!/usr/bin/python

def dfs(s, g, v, rs):
	if v[s] == 1:
		return
	
	rs.append(s)
	v[s] = 1

	for n in g[s]:
		if v[n] == 0 and n not in rs:
			return dfs(n, g, v, rs)
		else:
			return True
	 

def isCycle(g):
	v = {k:0 for k in g.keys()}
	for node in g.keys():
		rs = []
		if dfs(node, g, v, rs):
			print("There is a cycle!")
			return
	print("No Cycle!")
	
	


def testisCycle():
	graph = {
		1: [3, 4],
		3: [2, 5],
		2: [3, 5],
		5: [2, 3],
		4: [3, 1]
	}
		
	isCycle(graph)

testisCycle()

