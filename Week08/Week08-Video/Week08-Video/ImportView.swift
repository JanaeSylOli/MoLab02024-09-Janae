//
//  ImportView.swift
//  Week08-Video
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//

import SwiftUI
import PhotosUI

struct ImportView: View {
    @State private var videoURL: URL?
    @State private var isVideoPickerPresented = false
    
    var body: some View {
        VStack {
            Text("Import Your Video")
                .font(.title)
                .padding()
            
            Button("Choose Video") {
                isVideoPickerPresented = true
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
            if videoURL != nil {
                NavigationLink(destination: FilterView(videoURL: videoURL!)) {
                    Text("Next: Apply Filters")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .sheet(isPresented: $isVideoPickerPresented) {
            VideoPicker(videoURL: $videoURL) { url in
                self.videoURL = url
            }
        }
    }
}
