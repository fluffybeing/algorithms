#!/usr/bin/python

import Queue


def BFS(source, graph):
	v = {k:0 for k in graph.keys()}
	
	# mark source node visited and put it in
	# the queue
	q = Queue.Queue()
	v[source] = 1
	q.put(source)
#	print source
	
	while not q.empty():
		t = q.get()
		print t

		for n in graph[t]:
			if v[n] == 0:
				v[n] = 1
#				print n
				q.put(n)

def testBFS():
	graph = {
		1: [2, 4],
		2: [3, 1, 5],
		3: [2, 5],
		5: [2, 3],
		4: [1]
	}
	
	BFS(1, graph)

testBFS()