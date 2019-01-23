#!/usr/bin/python3

from queue import Queue

def BFS(source, graph):
	path = list()
	v = {k:0 for k in graph.keys()}
	
	# mark source node visited and put it in
	# the queue
	q = Queue()
	v[source] = 1
	q.put(source)
	
	while not q.empty():
		t = q.get()
		path.append(t)

		for n in graph[t]:
			if v[n] == 0:
				v[n] = 1
				q.put(n)
	return path

def testBFS():
	graph = {
		1: [2, 4],
		2: [3, 1, 5],
		3: [2, 5],
		5: [2, 3],
		4: [1]
	}
	
	path = BFS(1, graph)
	print(path)

testBFS()