#!/usr/bin/python3

from BinaryTree import Node

def inOrder(root):
	stack = []
	done = False
	current = root

	while(not done):
		if current is not None:
			stack.append(current)
			current = current.left
		else:
			if len(stack) > 0:
				current = stack.pop()
				print(current.data)
				current = current.right
			else:
				done = True

def main():
	root = Node(1) 
	root.left = Node(2) 
	root.right = Node(3) 
	root.left.left = Node(4) 
	root.left.right = Node(5) 
  
	inOrder(root) 

main()