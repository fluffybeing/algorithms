#!/usr/bin/python

class Node(object):
	
	def __init__(self, data):
		self.data = data
		self.left = None
		self.right = None
		

def isBST(root):
	if root is None:
		return True
	
	
	if root.left not None and root.left.data > root.data:
		return False
	
	if root.right not None and root.right.data < root.data:
		return False
	
	if not isBST(root.left) or not isBST(root.right):
		return 0
	
	return True
	
	
# use inorder traversal to check if it is bst or not

	
	