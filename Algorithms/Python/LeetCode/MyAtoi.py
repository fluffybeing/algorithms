#!/usr/bin/python3

# 8. String to Integer (atoi)

def intOverflow(num: int) -> int:
    INT_MIN = -2147483648
    INT_MAX = 2147483647

    if num < INT_MIN:
        return INT_MIN
    elif num > INT_MAX:
        return INT_MAX
    else:
        return num

def isOnlyNegation(num: str) -> bool:
    if num == "-" or num == "+":
        return True
    return False

def myAtoi(str: str) -> int:
    num = ""

    for (index, char) in enumerate(str):
        if char.isdigit():
            num += char
        elif char == "-" or char == "+":
            if index == 0:
                num += char
            else:
                beforeChar = str[index - 1]
                if beforeChar == " ":
                    num += char
                else:
                    break
        elif char == " ":
            if index > 0:
                beforeChar = str[index - 1]
                if beforeChar == " ":
                    continue
                else: 
                    break
        else:
            break

    if num:
        num = int(num) if not isOnlyNegation(num) else 0
        return intOverflow(num)
    else:
        return 0

def main():
    print(myAtoi(" + 1"))

main()
