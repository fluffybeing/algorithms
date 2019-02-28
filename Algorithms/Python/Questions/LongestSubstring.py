#!/usr/bin/python3


# This is wrong implementation of lcs algorithm 
# it will fail for case ABNDC <=> ABC: Correct output is ABC but the 
# algo will miss the between words.
def longestSubstring(m, n):

    size = -1
    for (i, _) in enumerate(m):
        for (j, _) in enumerate(m):
            subString = m[i:j]

            if subString in n:
                size = max(size, len(subString))
                
    return size



def main():
    m = "GeeksforGeeks"
    n = "GeeksQuiz"

    print(longestSubstring(m, n))

main()

