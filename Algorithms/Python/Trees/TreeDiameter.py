#!/usr/bin/python3

from BinaryTree import Node

def height(root):
	if root is None:
		return 0 

	l = 1 + height(root.left)
	r = 1 + height(root.right)
	return max(l, r)

def diameter(root):
	if root is None:
		return 0

	lh = height(root.left)
	rh = height(root.right)

	ld = diameter(root.left)
	rd = diameter(root.right)

	print(root.data, ld, rd, lh, rh)

	return max((lh + rh + 1), max(ld, rd))


def main():
	root = Node(1) 
	root.left = Node(2) 
	root.right = Node(3) 
	root.left.left = Node(4) 
	root.right.right = Node(5) 

	result = diameter(root)
	print(result)

main()