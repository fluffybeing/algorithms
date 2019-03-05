#!/usr/bin/python3

def myAtoi(str: str) -> int:
    num = ""
    for (index, char) in enumerate(str):
        if type(int(char)) is int:
            num += char
        elif char == "-":
            if index == 0:
                num += char
            else:
                beforeChar = str[index - 1]
                if beforeChar == " ":
                    num += char
                else:
                    break
        elif if char == " ":
            if index + 1 < len(str):
                afterChar = str[index + 1]
                if type(afterChar) is not int:
                    break
        else:
            break
    
    if num:
        return int(num)
    else:
        return 0
