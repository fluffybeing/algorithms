# -*- coding: utf-8 -*-
#!/usr/bin/python3

import sys

def merge(l, r, c):
	result = []

	i = j = 0

	while i < len(l) and j < len(r):
		if l[i] <= r[j]:
			result.append(l[i])
			i += 1
		else:
			result.append(r[j])
			j += 1
			c[0] += (len(l)-i)

	result += l[i:]
	result += r[j:]
	return result

def merge_sort(arr, c):

	if len(arr) < 2:
		return arr 

	mid = int(len(arr) / 2)
	left = merge_sort(arr[:mid], c)
	right = merge_sort(arr[mid:], c)

	return merge(left, right, c)

count = [0]
merge_sort([1, 3, 5, 2, 4, 6 ], count)
print(count[0])

