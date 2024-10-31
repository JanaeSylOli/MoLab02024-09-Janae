import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Are You Hungry Right Now?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)

                // Mood selection buttons with images
                HStack {
                    // Navigate to Hungry View
                    NavigationLink(destination: HungryView()) {
                        VStack {
                            Image("hungry_food")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text("Yes, I'm Hungry!")
                        }
                        .frame(width: 150, height: 150)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding()
                    }

                    // Navigate to Not Hungry View
                    NavigationLink(destination: NotHungryView()) {
                        VStack {
                            Image("not_hungry_food")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text("No, Not Hungry")
                        }
                        .frame(width: 150, height: 150)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
