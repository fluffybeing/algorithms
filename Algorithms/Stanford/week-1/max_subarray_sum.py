
# O(n^2)
def subarray_sum(arr):
    p = 0
    for i in range(len(arr)):
        sum = 0
        for j in range(i, len(arr)):
            sum += arr[j]
            p = max(p, sum)

    return p

def subarray_sum_2(arr):
    max_so_far = max_till_here = 0

    for elem in arr:
        max_till_here = max(elem, (max_till_here + elem))
        max_so_far = max(max_till_here, max_so_far)

    return max_so_far
    
arr = [-1, 2, 4, -3, 5, 2, -5, 2]
print(subarray_sum(arr))
print(subarray_sum_2(arr))