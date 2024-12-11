import Foundation

class EventbriteManager {
    private let apiKey = "EDGYQBK3SWCY2IISICMO"  // Your Eventbrite API Key
    private let baseURL = "https://www.eventbriteapi.com/v3"

    func fetchEvents(for theme: String, completion: @escaping ([Event]?) -> Void) {
        let urlString = "\(baseURL)/events/search/?q=\(theme)&token=\(apiKey)"
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
                let result = try decoder.decode(EventbriteResponse.self, from: data)
                print("API Response: \(result)") // Debugging statement
                let events = result.events.map { event in
                    return Event(
                        id: event.id,
                        name: event.name.text ?? "",
                        description: event.description.text ?? "",
                        start: ISO8601DateFormatter().date(from: event.start.utc) ?? Date(),
                        end: ISO8601DateFormatter().date(from: event.end.utc) ?? Date(),
                        url: event.url ?? ""
                    )
                }
                completion(events)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
