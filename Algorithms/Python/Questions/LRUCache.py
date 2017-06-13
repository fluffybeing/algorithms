#!/usr/bin/python

class LRUCache:

	# @param capacity, an integer
	def __init__(self, capacity):
		self.capacity = capacity
		self.d = {}
		self.lru = []
		
	# @return an integer
	def get(self, key):
		if key in self.d:
			self.lru.remove(key)
			self.lru.insert(0, key)
			return self.d[key]
		
		return -1
		

	# @param key, an integer
	# @param value, an integer
	# @return nothing
	def set(self, key, value):
		
		if len(self.d) >= self.capacity:
			if key in self.d:
				self.d[key] = value
				self.lru.remove(key)
				self.lru.insert(0, key)
			else:
				old_key = self.lru[-1]
				self.d.pop(old_key, None)
				self.lru.pop()
			
		self.d[key] = value
		self.lru.insert(0, key)
		
		print(self.lru)
		print(self.d)

#7 2 G 2 S 2 6 G 1 S 1 5 S 1 2 G 1 G 2
l = LRUCache(2)
#print l.get(2)
#l.set(2, 6)
#print l.get(1)
#l.set(1, 5)
#l.set(1, 2)
#print l.get(1)
#print l.get(2)
l.set(2, 1)
l.set(1, 1)
l.set(2, 3)
l.set(4, 1)
print l.get(1)
print l.get(2)