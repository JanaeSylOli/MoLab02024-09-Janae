import SwiftUI

struct ContentView: View {
    let gridSize = 10 // number of columns and rows
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width / CGFloat(gridSize)
            let height = geometry.size.height / CGFloat(gridSize)
            VStack(spacing: 0) {
                ForEach(0..<gridSize, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<gridSize, id: \.self) { col in
                            let isSlash = Bool.random() // Randomly pick between `true` and `false`
                            RandomLineShape(isSlash: isSlash)
                                .frame(width: width, height: height)
                        }
                    }
                }
            }
        }
        .background(Color.white) // Background color of the view
    }
}

struct RandomLineShape: View {
    let isSlash: Bool // Determines which line to draw
    
    var body: some View {
        Path { path in
            if isSlash {
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 1, y: 1))
            } else {
                path.move(to: CGPoint(x: 1, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 1))
            }
        }
        .stroke(Color.black, lineWidth: 2)
        .aspectRatio(1, contentMode: .fit)
    }
}

struct RandomElementsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            
        }
    }
}

