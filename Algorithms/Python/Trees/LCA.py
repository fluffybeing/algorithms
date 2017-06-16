#!/usr/bin/python


class Node(object):
	def __init__(self, data):
		self.data = data
		self.left = None
		self.right = None
		

def LCA(root, n1, n2):
	
	if root is None:
		return root
		
	
	if root.data > n1 and root.data > n2:
		return LCA(root.left, n1, n2)
	
	if root.data < n1 and root.data < n2:
		return LCA(root.right, n1, n2)
	
	return root


def findPath(root, path, k):
	
	if root is None:
		return False
	
	path.append(root.data)
	
	if root.data == k:
		return True
	
	if (root.left is not None and findPath(root.left, path, k)) or (root.right is not None and findPath(root.right, path, k)):
		return True
		
	path.pop()
	return False
	
	

def LACBT(root, n1, n2):
	
	path1 = []
	path2 = []
	
	if not findPath(root, path1, n1) or not findPath(root, path2, n2):
		return -1
	
	i = 0
	
	while (i < len(path1) and i < len(path2)):
		if path1[i] == path2[i]:
			break
		i += 1
	return path[i-1]



		