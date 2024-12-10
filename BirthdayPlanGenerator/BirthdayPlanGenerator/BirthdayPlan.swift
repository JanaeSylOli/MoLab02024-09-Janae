import Foundation

struct BirthdayPlan: Codable {
    let theme: String
    let activities: [Activity]
}

struct Activity: Codable {
    let name: String
    let location: String
    let budget: Int
    let description: String
    let time: String
}
