#!/usr/bin/python3

def twoSum(nums, target):
    nums.append(-9999999999)
    for (i, num) in enumerate(nums):
        remainingNum = target - num
        if remainingNum in nums[i+1:]:
            # index is important unless it will fail for the case
            # when both number are same [3, 3]
            j = nums.index(remainingNum, i+1)
            return [i, j]
    return None

def main():
    print(twoSum([2, 7, 11, 15], 9))

main()


