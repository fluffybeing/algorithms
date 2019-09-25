import Cocoa


// {abc} = {"", a, b, c, ab, ac, ba, bc, ca, cb, abc}

func powerSet(_ str: String) {
  powerSetUtil(str, index: 0, result: "")
}

func powerSetUtil(_ str: String, index: Int, result: String) {

  if str.count == index {
    print(result)
    return
  }

  let temp = result + String(Array(str)[index])

  powerSetUtil(str, index: index+1, result: temp)
  powerSetUtil(str, index: index+1, result: result)
}

powerSet("abc")

