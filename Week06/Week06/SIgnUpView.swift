//
//  SIgnUpView.swift
//  Week06
//
//  Created by Janae  Sylvester Oliver on 11/5/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Are You Hungry?")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("Sign Up")
                .font(.title)
                .padding(.bottom, 10)
            
            Text("Create your account to get started")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            TextField("Full Name", text: $fullName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 10)
            
            TextField("Email Address", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 10)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 10)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle sign-up action
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("MistyJadeGreen"))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
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
