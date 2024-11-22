import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Are You Hungry?")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("Login")
                .font(.title)
                .padding(.bottom, 10)
            
            Text("Welcome back! Please log in to your account")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            TextField("Email Address", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 10)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle login action
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("MistyJadeGreen"))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .foregroundColor(Color("SkyBlue"))
                }
            }
            .padding(.top, 20)
            
            NavigationLink(destination: ForgotPasswordView()) {
                Text("Forgot Password?")
                    .foregroundColor(Color("SkyBlue"))
                    .padding(.top, 10)
            }
        }
        .padding()
    }
}
