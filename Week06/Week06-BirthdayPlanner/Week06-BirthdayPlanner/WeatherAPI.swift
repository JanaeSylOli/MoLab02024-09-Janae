//
//  WeatherAPI.swift
//  Week06-BirthdayPlanner
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//
import Foundation

struct Weather: Codable {
    let main: Main
    let weather: [WeatherCondition]

    struct Main: Codable {
        let temp: Double
    }

    struct WeatherCondition: Codable {
        let description: String
    }
}

class WeatherAPI: ObservableObject {
    @Published var weather: Weather?
    private let apiKey = "ed37628ec8a2e6751ff1372e367a36f2"

    func fetchWeather(for location: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Weather.self, from: data)
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                } catch {
                    print("Error decoding weather data: \(error)")
                }
            }
        }.resume()
    }
}

