//
//  MainView.swift
//  Week08-Video
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("Video Manipulation App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            NavigationLink(destination: ImportView()) {
                Text("Start Editing")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
    }
}

