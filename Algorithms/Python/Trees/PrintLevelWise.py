#!/usr/bin/python

from BinaryTree import Node

def heightOfTree(root):
	
	if root is None:
		return 0
	
	l = 1 + heightOfTree(root.left)
	r = 1 + heightOfTree(root.right)
	
	return l if l > r else r

def printLevel(node, level):
	if node is None:
		return
	
	if level == 1:
		print node.data
	else:
		printLevel(node.left, level - 1)
		printLevel(node.right, level - 1)
	
	
def printLevelWise(root):
	
	h = heightOfTree(root)
	for i in range(1, h + 1):
		printLevel(root, i)	


def createBinaryTree():
	root = Node(1)
	root.left = Node(2)
	root.right = Node(3)
	root.left.left = Node(4)
	root.left.right = Node(5)
	root.right.left = Node(6)
	root.right.right = Node(7)
	
	return root

root = createBinaryTree()
printLevelWise(root)
