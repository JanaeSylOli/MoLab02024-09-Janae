//
//  LoginView.swift
//  BDayPlanner
//
//  Created by Janae  Sylvester Oliver on 12/5/24.
//

import SwiftUICore
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Bday Planner")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                // Handle login logic
            }
            .buttonStyle(.borderedProminent)

            Button("Sign Up") {
                // Navigate to SignUpView
            }
        }
        .padding()
    }
}
