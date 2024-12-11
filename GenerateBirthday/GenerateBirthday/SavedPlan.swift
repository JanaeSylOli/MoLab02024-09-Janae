import Foundation

struct SavedPlan: Identifiable, Codable {
    let id: UUID
    let theme: String
    let places: [Place]
    let events: [Event]

    init(theme: String, places: [Place], events: [Event]) {
        self.id = UUID()
        self.theme = theme
        self.places = places
        self.events = events
    }
}
