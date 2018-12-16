# -*- coding: utf-8 -*-
#!/usr/bin/python3


class Sort:

	def merge(self, left, right):
		sorted_array = []

		i = j = k = 0

		while i < len(left) and j < len(right):
			if left[i] < right[j]:
				sorted_array.append(left[i])
				i += 1
			else:
				sorted_array.append(right[j])
				j += 1
			k += 1

		sorted_array.extend(left[i:])
		sorted_array.extend(right[j:])

		return sorted_array


	def divide(self, array):
		mid_size = int(len(array) / 2)
		left = array[:mid_size]
		right = array[mid_size:]

		return left, right


	def merge_sort(self, array):

		if len(array) <= 1: return array

		left, right = self.divide(array)
		left_sort = self.merge_sort(left)
		right_sort = self.merge_sort(right)

		return self.merge(left_sort, right_sort)



sorted_list = Sort().merge_sort([-1, 0, 67, 89, 3, 5, 9])
print(sorted_list)
		
