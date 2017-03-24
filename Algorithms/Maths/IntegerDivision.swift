import Foundation


enum DivisionError : Error {
    case ZeroError
}

func integerDivision( a:Int, b:Int) throws -> Int {
    
    var a = a
    var count = 0

    if b == 0 {
        throw DivisionError.ZeroError
    } else {
        while a >= b {
            a -= b
            count += 1
        }
    }
    return count
}

func integerDivisionTest() {
    do {
        _ = try integerDivision(a: 5, b: 3)
    } catch let error {
        print(error)
    }
}
