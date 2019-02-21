#!/usr/bin/python


def nested(l):
	if not l:
		return 1

	count = 1
	for item in l:
		if type(item) is list:
			count = 1 + nested(item)
	return count


print(nested([]))