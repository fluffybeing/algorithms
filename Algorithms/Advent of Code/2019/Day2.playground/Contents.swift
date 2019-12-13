import Cocoa

let codes = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,19,5,23,1,
             23,6,27,2,9,27,31,1,5,31,35,1,35,10,39,1,39,10,43,2,43,9,47,
             1,6,47,51,2,51,6,55,1,5,55,59,2,59,10,63,1,9,63,67,
             1,9,67,71,2,71,6,75,1,5,75,79,1,5,79,83,1,
             9,83,87,2,87,10,91,2,10,91,95,1,95,9,99,2,99,9,103,2,10,103,
             107,2,9,107,111,1,111,5,115,1,115,2,119,1,119,6,0,99,2,0,14,0]


func programAlarm(nums: [Int]) -> [Int] {
  var nums = nums
  
  // replace position one with value 12
  nums[1] = 12
  nums[2] = 2
  
  return nums
}

enum OPCode: Int {
  case add = 1
  case multiply = 2
  case halt = 99
}

func intCode(nums: [Int]) -> Int {
  var nums = programAlarm(nums: nums)
  
  for position in stride(from: 0, to: nums.count, by: 4) {
    func getOperands(_ val: Int) -> (Int, Int) {
      guard val + 2 < nums.count else { return (0, 0) }
      
      let index1 = nums[val + 1]
      let index2 = nums[val + 2]
      
      return (nums[index1], nums[index2])
    }
    
    let operands = getOperands(position)
    if nums[position] == OPCode.add.rawValue {
      let sum = operands.0 + operands.1
      let storeIndex = nums[position + 3]
      nums[storeIndex] = sum
    } else if nums[position] == OPCode.multiply.rawValue {
      let multi = operands.0 * operands.1
      let storeIndex = nums[position + 3]
      nums[storeIndex] = multi
    } else if nums[position] == OPCode.halt.rawValue {
      break
    }
    
  }
  return nums[0]
}


print(intCode(nums: codes))



// Can improve with binary search
func intCode2(nums: [Int]) -> (Int, Int) {
  for noun in 0...99 {
    for verb in 0...99 {
      // Every time we have to initialize with new
      // input
      var nums = nums

      nums[1] = noun
      nums[2] = verb
      
      for position in stride(from: 0, to: nums.count, by: 4) {
        func getOperands(_ val: Int) -> (Int, Int) {
          guard val + 2 < nums.count else { return (0, 0) }
          
          let index1 = nums[val + 1]
          let index2 = nums[val + 2]
          
          return (nums[index1], nums[index2])
        }
        
        let operands = getOperands(position)
        if nums[position] == OPCode.add.rawValue {
          let sum = operands.0 + operands.1
          let storeIndex = nums[position + 3]
          nums[storeIndex] = sum
        } else if nums[position] == OPCode.multiply.rawValue {
          let multi = operands.0 * operands.1
          let storeIndex = nums[position + 3]
          nums[storeIndex] = multi
        } else if nums[position] == OPCode.halt.rawValue {
          if nums[0] == 19690720 {
            return (noun, verb)
          } else {
            break
          }
        }
      }
    }
  }
  
  return (0, 0)
}


print(intCode2(nums: codes))
