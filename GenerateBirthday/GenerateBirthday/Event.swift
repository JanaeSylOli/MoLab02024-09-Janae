import Foundation

struct Event: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let start: Date
    let end: Date
    let url: String
}

struct EventbriteResponse: Codable {
    let events: [EventbriteEvent]
}

struct EventbriteEvent: Codable {
    let id: String
    let name: EventbriteText
    let description: EventbriteText
    let start: EventbriteDate
    let end: EventbriteDate
    let url: String?
}

struct EventbriteText: Codable {
    let text: String?
}

struct EventbriteDate: Codable {
    let utc: String
}
