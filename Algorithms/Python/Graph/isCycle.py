#!/usr/bin/python3

def dfs(s, g, v, rs):
	if v[s]: return
	
	rs.append(s)
	v[s] = 1

	for n in g[s]:
		if v[n] and (n in rs):
			return True
		
		return dfs(n, g, v, rs)
		

def isCycle(g):
	v = {k:0 for k in g.keys()}
	for node in g.keys():
		rs = list()

		if dfs(node, g, v, rs): return "There is a cycle!"
			
	return "No Cycle!"
	

def testisCycle():
	graph = {
		1: [3, 4],
		3: [2, 5],
		2: [3, 5],
		5: [2, 3],
		4: [3, 1]
	}
		
	print(isCycle(graph))

testisCycle()

