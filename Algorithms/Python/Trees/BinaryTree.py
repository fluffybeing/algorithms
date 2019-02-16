#!/usr/bin/python3

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

def postorder(root):
	if root is None:
		return

	postorder(root.left)
	postorder(root.right)
	print(root.data)

def preorder(root):
	if root is None:
		return

	print(root.data)
	preorder(root.left)
	preorder(root.right)


def createBinaryTree():
	root = Node(1)
	root.left = Node(2)
	root.right = Node(5)
	root.left.left = Node(4)
	root.right.right = Node(6)
	
	return root

if __name__ == "__main__":
	tree = createBinaryTree()

	inorder(tree)
	postorder(tree)
	preorder(tree)
