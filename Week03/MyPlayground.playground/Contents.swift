import SwiftUI

struct RandomPatternView: View {
    // Grid size for pattern
    let gridSize = 20

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let columns = Int(width / CGFloat(gridSize))
            let rows = Int(height / CGFloat(gridSize))

            VStack(spacing: 0) {
                ForEach(0..<rows, id: \.self) { _ in
                    HStack(spacing: 0) {
                        ForEach(0..<columns, id: \.self) { _ in
                            RandomLine()
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

// View that generates a random line
struct RandomLine: View {
    var body: some View {
        // Randomly choose between two rotations and colors
        let isDiagonal = Bool.random()
        let randomColor = Color(
            red: Double.random(in: 0.2...1),
            green: Double.random(in: 0.2...1),
            blue: Double.random(in: 0.2...1)
        )

        return Rectangle()
            .fill(randomColor)
            .frame(width: 20, height: 2)
            .rotationEffect(.degrees(isDiagonal ? 45 : -45))
    }
}

// Preview for SwiftUI canvas
#Preview {
    RandomPatternView()
}

// App entry point
struct RandomPatternApp: App {
    var body: some Scene {
        WindowGroup {
            RandomPatternView()
        }
    }
}
