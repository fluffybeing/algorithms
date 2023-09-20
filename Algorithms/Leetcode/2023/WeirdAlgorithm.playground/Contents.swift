import Foundation


func weirdAlgorithm(num: Int) {
    var n = num
    
    while (n != 1) {
        print(n)
        
        if n % 2 == 0 {
            n = n/2
        } else {
            n = (n * 3) + 1
        }
    }
}


//weirdAlgorithm(num: 3)
//weirdAlgorithm(num: 138367)

let result = [0, 1, 2].flatMap {[$0, $0]}
print(result)
