import math

def spiral_memory(n):
    if n <= 1:
        return 0

    square_root_double = math.sqrt(n)
    square_root_int = int(square_root_double)
    num = 0

    if square_root_double - square_root_int > 0:
        if square_root_int % 2 == 0:
            num = square_root_int + 1
        else:
            num = square_root_int + 2
    else:
        num = square_root_int if (square_root_int % 2 == 1) else square_root_int + 1
    
    corner_elements = []
    for i in range(1, 5):
        element = (num - 2)**2 + i * (num - 1)
        corner_elements.append(element)
    
    mid = (num - 1) / 2 

    for elem in corner_elements:
        if abs(elem - n) <= mid:
            return (num - 1) - abs(elem - n)


    return corner_elements


print(spiral_memory(347991))
# print(spiral_memory(25))

# 6   5  4  3 4  5  6
# 37 36 35 34 33 32 31
