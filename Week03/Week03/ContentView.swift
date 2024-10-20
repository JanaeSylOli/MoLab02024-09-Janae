import SwiftUI

struct ContentView: View {
    // SHAPES
    let shapeArray: [String] = ["Circle", "Rectangle", "Capsule", "Ellipse"]
    
    // SHAPE AND SIZE
    @State var selectedShapeIndex: Double = 0 // DOUBLE SLIDER
    @State var shapeSize = 150.0
    
    var body: some View {
        ZStack {
            // BACKGROUND
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // TITLE
                Text("Shape Viewer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 40)
                    .shadow(radius: 5)
                
                // SHAPE
                let currentShape = shapeArray[Int(selectedShapeIndex)]
                let purpleColor = Color.purple // Constant purple color
                
                // TRANSITION
                ZStack {
                    if currentShape == "Circle" {
                        Circle()
                            .fill(purpleColor)
                            .frame(width: shapeSize, height: shapeSize)
                    } else if currentShape == "Rectangle" {
                        Rectangle()
                            .fill(purpleColor)
                            .frame(width: shapeSize, height: shapeSize)
                    } else if currentShape == "Capsule" {
                        Capsule()
                            .fill(purpleColor)
                            .frame(width: shapeSize, height: shapeSize / 2) // CAPSULE
                    } else if currentShape == "Ellipse" {
                        Ellipse()
                            .fill(purpleColor)
                            .frame(width: shapeSize, height: shapeSize / 1.5)
                    }
                }
                .cornerRadius(20)
                .shadow(radius: 10)
                .transition(.scale) // TRANSITION EFFECT
                
                // SLIDER TO CHANGE SHAPE
                VStack {
                    Slider(value: $selectedShapeIndex, in: 0...Double(shapeArray.count - 1), step: 1.0) {
                        Text("Select Shape")
                    }
                    .padding(.horizontal, 40)
                    .accentColor(.orange)
                    
                    Text("Shape: \(shapeArray[Int(selectedShapeIndex)])")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                
                // CONTROLLING SHAPE SIZE
                VStack {
                    Slider(value: $shapeSize, in: 50.0...250.0) {
                        Text("Shape Size")
                    }
                    .padding(.horizontal, 40)
                    .accentColor(.green)
                    
                    Text("Size: \(Int(shapeSize))")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
