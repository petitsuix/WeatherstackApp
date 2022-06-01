//
//  LocationInfo.swift
//  WeatherstackApp
//
//  Created by Richardier on 01/06/2022.
//

import Foundation

// MARK: - Location
struct Location: Codable {
    let name: String
    let country: String
    let region: String
    let latitude: String
    let longitude: String
    let timeZoneID: String
    let localTime: String

    enum CodingKeys: String, CodingKey {
        case name, country, region
        case latitude = "lat"
        case longitude = "lon"
        case timeZoneID = "timezone_id"
        case localTime = "localtime"
    }
}
