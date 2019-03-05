

# input: 3[abc]4[ab]c
# output: abcabcabcababababc

def extractDigit(string):
    for char in string:
        try:
            return int(char)
        except:
            continue
    return 1


def extractString(string):
    open = "["
    close = "]"



def compression(string):
    if not string:
        return ""
    
    digit = extractDigit(string)
    string = string.replace(str(digit), "")
    
    return string[0] + compression(string[1:])


def main():
    result = compression("3abc2w")
    print(result)

main()