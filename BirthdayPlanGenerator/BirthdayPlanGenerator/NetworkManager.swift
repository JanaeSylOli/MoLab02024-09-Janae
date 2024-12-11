//
//  NetworkManager.swift
//  BirthdayPlanGenerator
//
//  Created by Janae  Sylvester Oliver on 12/11/24.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "AIzaSyAL90XaanV66tjaOyco9C1jt0n6yZmRA0c"

    func fetchActivities(for theme: String, completion: @escaping ([Activity]?) -> Void) {
        let url = "https://maps.googleapis.com/maps/api/place/textsearch/json"
        let parameters: [String: Any] = [
            "query": theme,
            "location": "40.7128,-74.0060",  // Replace with the desired location coordinates
            "radius": 5000,                 // Radius in meters
            "key": apiKey
        ]

        AF.request(url, parameters: parameters).responseJSON { response in
            guard let data = response.data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(PlacesResponse.self, from: data)
                let activities = result.results.map { place -> Activity in
                    return Activity(
                        name: place.name,
                        location: place.formatted_address ?? "Unknown",
                        budget: Int.random(in: 10...100), // Example budget calculation
                        description: place.types.first ?? "No description",
                        time: "Varies"
                    )
                }
                completion(activities)
            } catch {
                completion(nil)
            }
        }
    }
}

struct PlacesResponse: Codable {
    let results: [Place]
}

struct Place: Codable {
    let name: String
    let formatted_address: String?
    let types: [String]
}
