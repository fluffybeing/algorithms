#!/usr/bin/python3


class Trie(object):

    def __init__(self):
        self.head = {}

    def add(self, word):
        cur = self.head

        for char in word:
            if char not in cur:
                cur[char] = {}
            cur = cur[char]
        cur['*'] = True
    
    def search(self, word):
        cur = self.head 

        for char in word:
            if char not in cur:
                return False
            cur = cur[char]
        
        return True if '*' in cur else False


def main():
    trie = Trie()

    trie.add("hi")
    trie.add("hello")

    print(trie.search("hel"))

main()