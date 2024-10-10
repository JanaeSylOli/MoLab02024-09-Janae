import SwiftUI

struct ContentView: View {
    let gridSize = 20 // Size of the grid cells
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let columns = Int(width / CGFloat(gridSize))
            let rows = Int(height / CGFloat(gridSize))
            
            VStack(spacing: 0) {
                ForEach(0..<rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<columns, id: \.self) { column in
                            RandomShape()
                                .frame(width: CGFloat(gridSize), height: CGFloat(gridSize))
                        }
                    }
                }
            }
            .frame(width: width, height: height)
        }
        .background(Color.black)
    }
}

struct RandomShape: View {
    var body: some View {
        let randomNumber = Int.random(in: 0...1)
        
        // Randomly choose between two rotations (0° and 45°)
        return Rectangle()
            .stroke(lineWidth: 2)
            .rotationEffect(.degrees(randomNumber == 0 ? 0 : 45))
            .foregroundColor(randomNumber == 0 ? .blue : .orange)
    }
}

struct RandomShapesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
