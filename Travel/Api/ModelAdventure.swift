// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let adventure = try? JSONDecoder().decode(Adventure.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - AdventureElement
public struct AdventureElement: Codable, Equatable {
    public let id: String?
    public let name: String?
    public let description: String?
    public let altitude: String?
    public let hasDeathZone: Bool?
    public let location: String?
    public let firstClimber: String?
    public let firstClimbedDate: String?
    public let mountain_img: String?
    public let country_flag_img: String?

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case altitude
        case hasDeathZone
        case location
        case firstClimber
        case firstClimbedDate
        case mountain_img
        case country_flag_img
    }

    public init(id: String?, name: String?, description: String?, altitude: String?, hasDeathZone: Bool?, location: String?, firstClimber: String?, firstClimbedDate: String?, mountainImg: String?, countryFlagImg: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.altitude = altitude
        self.hasDeathZone = hasDeathZone
        self.location = location
        self.firstClimber = firstClimber
        self.firstClimbedDate = firstClimbedDate
        self.mountain_img = mountainImg
        self.country_flag_img = countryFlagImg
    }
}

public typealias Adventure = [AdventureElement]


