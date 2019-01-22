
def divide(num):
    mid = len(num) / 2
    left = divide(num[:mid])
    right = divide(num[mid:])

    return left, right

def median_sorted_arrays(num1, num2):
    left1, right1 = divide(num1)
    left2, right2 = divide(num2)

    

