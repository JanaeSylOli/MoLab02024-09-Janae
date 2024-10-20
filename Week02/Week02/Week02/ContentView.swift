import SwiftUI

struct ContentView: View {
    
    // ASCII Art of a kitten
    let kittenAscii = """
         /\\_/\\  
        ( o.o ) 
         > ^ <
    """
    
    var body: some View {
        VStack {
            Text(kittenAscii)
                .font(.system(.body, design: .monospaced)) // Use monospaced font for ASCII art
                .padding()
                .multilineTextAlignment(.center) // Align the ASCII art in the center
        }
    }
}

#Preview {
    ContentView()
}
