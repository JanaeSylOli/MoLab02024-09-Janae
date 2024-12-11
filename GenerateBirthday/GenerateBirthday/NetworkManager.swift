import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "AIzaSyAL90XaanV66tjaOyco9C1jt0n6yZmRA0c"

    func fetchPlaces(for theme: String, completion: @escaping ([Place]?) -> Void) {
        let urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(theme)&location=40.7128,-74.0060&radius=5000&key=\(apiKey)"
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(String(describing: error))")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(PlacesResponse.self, from: data)
                var places = [Place]()
                for placeDetails in result.results {
                    let place = Place(
                        id: placeDetails.place_id,
                        name: placeDetails.name,
                        location: placeDetails.formatted_address ?? "Unknown",
                        budget: Int.random(in: 10...100),
                        description: placeDetails.types.first ?? "No description",
                        time: "Varies",
                        website: placeDetails.website
                    )
                    places.append(place)
                }
                completion(places)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
