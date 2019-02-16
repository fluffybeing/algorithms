
#!/usr/bin/python3

class TreeNode(object):

	def __init__(self, data=None):
		self.data = data
		self.children = []

	def add_child(self, node):
		self.children.append(node)

	def __str__(self):
		return str(self.data)

	def __eq__(self, other): 
		return self.data == other.data

# This doesn't work because I haven't defined the biderectional
# relationship of the node
def dfs(s, e):
	print(s)
	for child in s.children:
		if s != e: dfs(child, s)


one = TreeNode(1)
two = TreeNode(2)
three = TreeNode(3)
four = TreeNode(4)
five = TreeNode(5)

three.add_child(four)
two.add_child(five)

root = TreeNode(0)
root.add_child(one)
root.add_child(two)
root.add_child(three)

dfs(root, TreeNode())
