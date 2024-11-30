//
//  SaveItem.swift
//  Week08-Video
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//
import SwiftUI
import Photos

struct SaveView: View {
    var videoURL: URL
    @State private var isSaving = false
    
    var body: some View {
        VStack {
            Text("Save Your Video")
                .font(.title)
                .padding()
            
            Button("Save to Library") {
                saveVideo()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .alert(isPresented: $isSaving) {
                Alert(title: Text("Video Saved!"), message: Text("Your video has been saved to the photo library."), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func saveVideo() {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoURL)
        }) { saved, error in
            if saved {
                DispatchQueue.main.async {
                    self.isSaving = true
                }
            }
        }
    }
}

