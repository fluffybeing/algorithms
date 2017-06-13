#!/usr/bin/python


def nested_list(l):
	
	if type(l) == int:
		print(l),
		return l
	
	for elem in l:
		nested_list(elem)

nested_list([1,[4,3],6,[5,[1,0]]])


		
	
	