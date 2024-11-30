//
//  PreviewView.swift
//  Week08-Video
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//

import SwiftUI
import AVKit

struct PreviewView: View {
    var videoURL: URL
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack {
            if let player = player {
                VideoPlayer(player: player)
                    .frame(height: 300)
                    .onAppear {
                        player.play()
                    }
            } else {
                Text("Preview Unavailable")
                    .frame(height: 300)
            }
            
            NavigationLink(destination: SaveView(videoURL: videoURL)) {
                Text("Save Video")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            player = AVPlayer(url: videoURL)
        }
    }
}
