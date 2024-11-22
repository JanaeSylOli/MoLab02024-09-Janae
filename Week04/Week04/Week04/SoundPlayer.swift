//

import SwiftUICore
import AVFoundation
import SwiftUI

struct NotHungrySoundPlayerView: View {
    @State var audioPlayer: AVPlayer?

    let notHungrySoundURL = "https://pixabay.com/sound-effects/happy-days-123082/"

    var body: some View {
        VStack {
            Text("Sounds Great")
                .font(.largeTitle)
                .padding(.bottom, 20)

            // BUTTON
            Button(action: {
                playSound(from: notHungrySoundURL)
            }) {
                Text("Play Relaxing Sound")
                    .font(.title2)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }

    // PLAY SOUND
    func playSound(from url: String) {
        guard let soundURL = URL(string: url) else {
            print("Invalid URL")
            return
        }
        audioPlayer = AVPlayer(url: soundURL)
        audioPlayer?.play()
        print("audioPlayer", audioPlayer ?? "missing")
    }
}

#Preview {
    ContentView()
}
