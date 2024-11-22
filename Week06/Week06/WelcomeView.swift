//
//  WelcomeView.swift
//  Week06
//
//  Created by Janae  Sylvester Oliver on 11/5/24.
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Are You Hungry?")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("Welcome to Are You Hungry!")
                .font(.title)
                .padding(.bottom, 10)
            
            Text("Your journey to delicious food starts here")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle get started action
            }) {
                Text("Get Started")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("RichGold"))
                    .cornerRadius(8)
            }
            .padding(.bottom, 10)
            
            Button(action: {
                // Handle explore recipes action
            }) {
                Text("Explore Recipes")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("CherryBlossomPink"))
                    .cornerRadius(8)
            }
            .padding(.bottom, 10)
            
            Button(action: {
                // Handle view profile action
            }) {
                Text("View Your Profile")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("CherryBlossomPink"))
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
    }
}

