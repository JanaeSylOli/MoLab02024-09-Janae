import Foundation

struct Place: Identifiable, Codable {
    let id: String
    let name: String
    let location: String
    let budget: Int
    let description: String
    let time: String
    let website: String?
}

struct PlacesResponse: Codable {
    let results: [PlaceDetails]
}

struct PlaceDetails: Codable {
    let place_id: String
    let name: String
    let formatted_address: String?
    let types: [String]
    let website: String?
}
