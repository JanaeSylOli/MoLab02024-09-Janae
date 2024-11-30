//
//  FilterView.swift
//  Week08-Video
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//
import SwiftUI
import AVKit

struct FilterView: View {
    var videoURL: URL
    @State private var selectedFilter: FilterType = .none
    @State private var player: AVPlayer?
    
    enum FilterType: String, CaseIterable {
        case none = "None"
        case sepia = "Sepia"
        case grayscale = "Grayscale"
        case cool = "Cool"
    }
    
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
            
            Picker("Choose Filter", selection: $selectedFilter) {
                ForEach(FilterType.allCases, id: \.self) { filter in
                    Text(filter.rawValue).tag(filter)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button("Apply Filter") {
                applyFilter()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
            NavigationLink(destination: PreviewView(videoURL: videoURL)) {
                Text("Next: Preview")
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
    
    func applyFilter() {
        // Implement the filter logic here as described earlier.
        // Example: Use AVVideoComposition to modify video frames based on `selectedFilter`.
        player = AVPlayer(url: videoURL) // Placeholder
    }
}

