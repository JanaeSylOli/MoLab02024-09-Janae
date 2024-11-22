
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to SmileScan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Text("Analyze your dental health with AI technology.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()

                NavigationLink(destination: ImageCaptureView()) {
                    Text("Start Scanning")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
