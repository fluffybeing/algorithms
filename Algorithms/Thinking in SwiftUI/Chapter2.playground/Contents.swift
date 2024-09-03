import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    @State var counter = 0

    var body: some View {
        print("Content view")
        return VStack {
            Button("Tap me") {
                self.counter += 1
            }
            .padding()
            LabelView(number: counter)
        }
    }
}

struct LabelView: View {
    let number: Int

    var body: some View {
        print("LabelView")
        return Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
    }
}

struct ListView: View {
    var body: some View {
        ForEach(1...3, id:\.self) { x in
            Text("Item \(x)")
        }
    }
}

struct LabelView2: View {
    @Binding var counter: Int

    var body: some View {
        Group {
            if counter > 0 {
                Text("You've tapper \(counter) times")
            }
        }
    }
}

struct LabelView3: View {
    @Binding var counter: Int

    var body: some View {
        if counter > 0 {
            AnyView(Text("You've tapper \(counter) times"))
        } else {
            AnyView(Image(systemName: "lightbulb"))
        }
    }
}

// SwiftUI uses following dynamic properties for triggering updates
// Binding
// Environment
// EnvironmentObject
// FetchRequest
// GestureState
// ObservedObject
// State


// Property Wrappers
struct ContentView2: View {
    @State var counter = 0

    var body: some View {
        return VStack {
            Button("Tap me") { self.counter += 1 }
            LabelView3(counter: $counter)
        }
    }
}

struct ContentView3: View {
    var counter = State(initialValue: 0)

    var body: some View {
        return VStack {
            Button("Tap me") { self.counter.wrappedValue += 1 }
            LabelView3(counter: counter.projectedValue)
        }
    }
}

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob: View {
    @Binding var value: Double

    var body: some View {
        KnobShape()
            .fill(Color.gray)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                self.value = self.value < 0.5 ? 1 : 0
            }
    }
}

struct ContentView4: View {
    @State var volume: Double = 0.5
    var body: some View {
        VStack {
            Knob(value: $volume)
                .frame(width: 100, height: 100)
            Slider(value: $volume, in: (0...1))
        }
    }
}


let view = ContentView4()
PlaygroundPage.current.setLiveView(view)

