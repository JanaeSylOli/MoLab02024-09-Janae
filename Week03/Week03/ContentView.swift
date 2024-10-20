import SwiftUI

struct ContentView: View {
    // Updated array with only valid SF Symbols for insects
    let insectArray = ["ant", "ladybug", "tortoise", "leaf", "pawprint"]
    
    // State variables for insect index and element size
    @State var selectedInsectIndex: Double = 0 // Must be a Double for the slider
    @State var elementSize = 150.0
    
    var body: some View {
        VStack {
            // Title or header text
            Text("Random Animal Symbols ")
                .font(.title)
                .padding()
            
            // Get the current insect based on the index
            let currentInsect = insectArray[Int(selectedInsectIndex)] // Convert to Int when accessing the array
            let randomFillFlag = Bool.random() // Randomly decide if it's filled
            let randomColor = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1)
            )
            
            Image(systemName: currentInsect + (randomFillFlag ? ".fill" : ""))
                .resizable()
                .frame(width: elementSize, height: elementSize)
                .foregroundColor(randomColor) // Apply random color
                .padding()
            
            // Slider to change the selected insect
            VStack {
                Slider(value: $selectedInsectIndex, in: 0...Double(insectArray.count - 1), step: 1.0) {
                    Text("Select Insect")
                }
                .padding()
                
                Text("Insect: \(insectArray[Int(selectedInsectIndex)].capitalized)")
            }
            
            // Controls to adjust the insect size
            VStack {
                Slider(value: $elementSize, in: 50.0...200.0) {
                    Text("Insect Size")
                }
                Text("Size: \(Int(elementSize))")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
