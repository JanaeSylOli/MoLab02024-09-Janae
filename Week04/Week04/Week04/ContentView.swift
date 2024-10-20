import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Are You Hungry Right Now?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)

                // MOOD BUTTON
                HStack {
                    // NAVI FOR HUNGRY
                    NavigationLink(destination: HungrySoundPlayerView()) {
                        VStack {
                            Image(systemName: "fork.knife")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Text("Yes, I'm Hungry!")
                        }
                        .frame(width: 150, height: 150)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding()
                    }

                    //NAVI FOR NOT HUNGRY
                    NavigationLink(destination: NotHungrySoundPlayerView()) {
                        VStack {
                            Image(systemName: "moon.zzz")
                                .resizable()
                                .frame(width: 60, height: 60)
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
