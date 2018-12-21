class Solution(object):
    def myAtoi(self, str):
        """
        :type str: str
        :rtype: int
        """
        
        # discard extra white space
        atoi_string = str.strip()
        
        INT_MAX = 2147483649
        INT_MIN = -(INT_MAX - 1)
        sign = ["-", "+"]
        
        result = ""
        
        for index, char in enumerate(list(atoi_string)):
            if index == 0:
                if char.isdigit() or char in sign:
                    result += char
                else: 
                    return 0
            else:
                if char.isdigit():
                    result += char
                else:
                    break
        
        num = int(result)  
        if num < INT_MIN or num > INT_MAX:
            return INT_MIN if num < 0 else INT_MAX
        
        return num

s = Solution()
print(s.myAtoi("42"))
print(s.myAtoi("4193 with words"))
print(s.myAtoi("42"))
print(s.myAtoi("42"))