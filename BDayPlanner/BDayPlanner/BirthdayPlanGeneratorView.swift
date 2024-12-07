import SwiftUI

struct BirthdayPlanGeneratorView: View {
    @State private var theme: String = "" // User-inputted theme
    @State private var activity: String? // Fetched activity
    @State private var isLoading: Bool = false // Loading state
    @State private var errorMessage: String? // Error message

    var body: some View {
        NavigationWrapper {
            VStack(spacing: 20) {
                // Theme input
                TextField("Enter a Theme", text: $theme)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Generate Button
                Button(action: {
                    findRandomActivity()
                }) {
                    Text("Generate Random Plan")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(isLoading) // Disable button while loading
                
                // Loading Indicator
                if isLoading {
                    ProgressView("Loading...")
                }

                // Display Activity
                if let activity = activity {
                    Text("Activity: \(activity)")
                        .font(.title2)
                        .padding()
                }

                // Display Error Message
                if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationTitle("Plan Generator")
            .padding()
        }
    }
    
    func findRandomActivity(){
        print("console.log")
        if let path = Bundle.main.path(forResource: "birthday_plans", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let allPlans = jsonResult["birthdayPlans"] as? [Any] {
                            // do stuff
                      print(allPlans)
                  }
                print(jsonResult)
              } catch {
                  print("error")// handle error
              }
        }
        }
    }

    /// Fetch a random activity from the Bored API
//    func fetchRandomActivity() {
//        isLoading = true
//        errorMessage = nil
//        activity = nil
//
//        let url = URL(string: "https://www.boredapi.com/api/activity")!
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            DispatchQueue.main.async {
//                isLoading = false
//
//                if let error = error {
//                    errorMessage = "Network error: \(error.localizedDescription)"
//                    return
//                }
//
//                guard let data1 = data else {
//                    errorMessage = "No data received"
//                    return
//                }
//                print(data1)
//                
//                guard let response = response else {
//                    errorMessage = "No data received"
//                    return
//                }
//                print(response)
//
//
//                do {
//                    let result = try JSONDecoder().decode(ActivityResponse.self, from: data1)
//                    activity = result.activity
//                } catch {
//                    errorMessage = "xFailed to decode response: \(error.localizedDescription)"
//                }
//            }
//        }.resume()
//    }
//}

// API Response Model
struct ActivityResponse: Codable {
    let activity: String
}

#Preview {
    BirthdayPlanGeneratorView()
}
