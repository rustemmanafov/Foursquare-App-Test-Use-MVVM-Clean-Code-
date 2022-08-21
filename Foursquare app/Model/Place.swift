// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let place = try? newJSONDecoder().decode(Place.self, from: jsonData)

import Foundation

// MARK: - Place
struct Place: Codable {
    let fsqID: String?
    let categories: [Category]?
    let chains: [String]?
    let geocodes: Geocodes?
    let link: String?
    let location: Location?
    let name: String?
    let relatedPlaces: RelatedPlaces?
    let timezone: String?

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case categories, chains, geocodes, link, location, name
        case relatedPlaces = "related_places"
        case timezone
    }
}

// MARK: - Child
struct Child: Codable {
    let fsqID, name: String?

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case name
    }
}
