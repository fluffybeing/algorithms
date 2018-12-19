#!/usr/bin/python3


def dfs(s, g, v, b):
	if v[s] == 1:
		return
	v[s] = 1

	for n in g[s]:
		if b[s] == b[n]:
			return True
	
		if v[n] == 0 and b[n] == None:
			b[n] = 'r' if b[s] == 'b' else 'b'
			return dfs(n, g, v, b)


def isBipartite(g):
	v = {k:0 for k in g.keys()}
	b = {k:None for k in g.keys()}
	b[1] = 'b'
	if dfs(1, g, v, b):
		return True
	return False



def testisBipartite():
	g = {
		1: [2, 4],
		2: [1, 3],
		4: [1],
		3: [2, 5],
		5: [3]
	}
	print(isBipartite(g))
	
testisBipartite()