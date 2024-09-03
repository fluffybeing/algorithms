import SwiftUI
import PlaygroundSupport
import UIKit

struct ContentView: View {
    @State var counter = 0

    var body: some View {
        VStack {
            Button(action: { self.counter += 1}, label: {
                Text("Tap me")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            })
        }.debug()

        if counter > 0 {
            Text("You've tapped \(counter) times")
        } else {
            Text("You've not yet tapped")
        }

        // ViewBuilders

//        VStack {
//            Text("ViewBuilder")
//            if true {
//                Image(systemName: "circle")
//                    .background(Color(.red))
//            }
//            if false {
//                Image(systemName: "square")
//            } else {
//                Divider()
//            }
//
//        }
    }


}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

//let parameters = ["hello": 5, "world": 4]
//
//let stringTuples: [(String, String)] = parameters.map({ k,v in
//           return (k, "\(v)")
//       })
//let analyticsParameters: [String: String] = Dictionary<String, String>(
//   uniqueKeysWithValues: stringTuples
//)
//
//print(parameters.mapValues({ "\($0)" }))
let view = ContentView()
PlaygroundPage.current.setLiveView(view)

