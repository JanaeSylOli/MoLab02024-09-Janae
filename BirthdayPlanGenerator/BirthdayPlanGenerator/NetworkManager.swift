import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "AIzaSyAL90XaanV66tjaOyco9C1jt0n6yZmRA0c"

    func fetchActivities(for theme: String, completion: @escaping ([Activity]?) -> Void) {
        let urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(theme)&location=40.7128,-74.0060&radius=5000&key=\(apiKey)"
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
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
        task.resume()
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
