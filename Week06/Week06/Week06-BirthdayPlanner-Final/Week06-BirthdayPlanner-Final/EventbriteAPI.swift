//
//  EventbriteAPI.swift
//  Week06-BirthdayPlanner-Final
//
//  Created by Janae  Sylvester Oliver on 11/30/24.
//
import Foundation

struct Event: Identifiable, Codable {
    let id: String
    let name: EventName
    let start: EventStart

    struct EventName: Codable {
        let text: String
    }

    struct EventStart: Codable {
        let local: String
    }
}

struct EventbriteResponse: Codable {
    let events: [Event]
}

class EventbriteAPI: ObservableObject {
    @Published var events: [Event] = []
    private let apiKey = "EDGYQBK3SWCY2IISICMO"

    func fetchEvents(keyword: String, location: String) {
        let urlString = "https://www.eventbriteapi.com/v3/events/search/?q=\(keyword)&location.address=\(location)&token=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(EventbriteResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.events = response.events
                    }
                } catch {
                    print("Error decoding Eventbrite data: \(error)")
                }
            }
        }.resume()
    }
}

