//
//  FoorgotPasswordView.swift
//  Week06
//
//  Created by Janae  Sylvester Oliver on 11/5/24.
//
import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Text("Are You Hungry?")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("Forgot Password")
                .font(.title)
                .padding(.bottom, 10)
            
            Text("Enter your email address to reset your password")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            TextField("Email Address", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle password reset action
            }) {
                Text("Reset Password")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("MistyJadeGreen"))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            HStack {
                Text("Remember your password?")
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                        .foregroundColor(Color("SkyBlue"))
                }
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

