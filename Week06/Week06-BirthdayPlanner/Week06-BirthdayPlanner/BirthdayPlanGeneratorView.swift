//
//  BirthdayPlanGeneratorView.swift
//  Week06-BirthdayPlanner
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//
import SwiftUI

struct BirthdayPlanGeneratorView: View {
    @StateObject private var eventbriteAPI = EventbriteAPI()
    @StateObject private var weatherAPI = WeatherAPI()
    @State private var location: String = "New York"
    @State private var keyword: String = "birthday"
    @State private var showResults = false

    var body: some View {
        NavigationView {
            VStack {
                Text("🎉 Birthday Plan Generator")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()

                // Location Input
                TextField("Enter location (e.g., New York)", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Keyword Input
                TextField("Enter activity keyword (e.g., party, dinner)", text: $keyword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Generate Plan Button
                Button("Generate Plan") {
                    eventbriteAPI.fetchEvents(keyword: keyword, location: location)
                    weatherAPI.fetchWeather(for: location)
                    showResults = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()

                // Display Results
                if showResults {
                    // Weather Information
                    if let weather = weatherAPI.weather {
                        VStack(alignment: .leading) {
                            Text("🌤 Weather in \(location):")
                                .font(.headline)
                            Text("Temperature: \(Int(weather.main.temp))°C")
                            Text("Condition: \(weather.weather.first?.description.capitalized ?? "N/A")")
                        }
                        .padding()
                    }

                    // Event Information
                    if !eventbriteAPI.events.isEmpty {
                        VStack(alignment: .leading) {
                            Text("🎭 Suggested Events:")
                                .font(.headline)
                            List(eventbriteAPI.events) { event in
                                VStack(alignment: .leading) {
                                    Text(event.name.text)
                                        .font(.headline)
                                    Text("Starts: \(event.start.local)")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding()
                    } else {
                        Text("No events found for \(keyword) in \(location).")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Birthday Plan")
        }
    }
}

struct BirthdayPlanGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayPlanGeneratorView()
    }
}

