#!/usr/bin/python3

class Vertex:
    def __init__(self, key):
        self.id = key
        self.connectedTo = {}

    def addNeighbour(self, nbr, weight=0):
        self.connectedTo[nbr] = weight
    
    def __str__(self):
        return str(self.id) + ' connectedTo: ' + str([x.id for x in self.connectedTo])

    def getConnections(self):
        return self.connectedTo.keys()

    def getId(self):
        return self.id

    def getWeight(self,nbr):
        return self.connectedTo[nbr]

class Graph:
    def __init__(self):
        self.vertList = {}
        self.numVertices = 0

    def addVertex(self, key):
        self.numVertices += 1
        newVertex = Vertex(key)
        self.vertList[key] = newVertex
        return newVertex

    def addEdge(self, f, t, weight=0):
        if f not in self.vertList:
            self.addVertex(f)
        if t not in self.vertList:
            self.addVertex(t)
        self.vertList[f].addNeighbor(self.vertList[t], weight)


    def getVertex(self, key):
        return next(self.vertList[x] for x in self.vertList.keys() if x == key)

    def getVertices(self):
        return self.vertList.keys()

    
g = Graph()
for i in range(6):
    g.addVertex(i)

print(g.vertList)
