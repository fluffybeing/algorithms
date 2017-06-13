#!/usr/bin/python

class Node(object):
	def __init__(self, data):
		self.data = data
		self.left = None
		self.right = None
		

def inorder(root):
	if root is None:
		return
		
	inorder(root.left)
	print(root.data)
	inorder(root.right)


def createBinaryTree():
	root = Node(1)
	root.left = Node(2)
	root.right = Node(3)
	
	return root

if __name__ == "__main__":
	inorder(createBinaryTree())