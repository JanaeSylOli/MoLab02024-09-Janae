// PAGE 2: Sound Player for "Hungry" option

import SwiftUICore
import AVFoundation
import SwiftUI

struct HungrySoundPlayerView: View {
    @State var audioPlayer: AVPlayer?

    
    let hungrySoundURL = "https://pixabay.com/sound-effects/bite-83092/"

    var body: some View {
        VStack {
            Text("Hungry Sound")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Button(action: {
                playSound(from: hungrySoundURL)
            }) {
                Text("Play Food Sound")
                    .font(.title2)
                    .frame(width: 200, height: 50)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }

    func playSound(from url: String) {
        guard let soundURL = URL(string: url) else {
            print("Invalid URL")
            return
        }
        audioPlayer = AVPlayer(url: soundURL)
        audioPlayer?.play()
    }
}
