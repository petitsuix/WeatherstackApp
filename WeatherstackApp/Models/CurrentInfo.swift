//
//  CurrentInfo.swift
//  WeatherstackApp
//
//  Created by Richardier on 01/06/2022.
//

import Foundation

// MARK: - Current
struct Current: Codable {
    let observationTime: String
    let temperature: Int
    let weatherCode: Int
    let weatherIcons: [String]
    let weatherDescriptions: [String]
    let windSpeed: Int
    let windDegree: Int
    let windDirection: String
    let pressure: Int
    let precipitation: Float
    let humidity: Int
    let cloudCover: Int
    let feelsLike: Int
    let uvIndex: Int
    let visibility: Int
    let isDay: String

    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temperature
        case weatherCode = "weather_code"
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDirection = "wind_dir"
        case pressure
        case precipitation = "precip"
        case humidity
        case cloudCover = "cloudcover"
        case feelsLike = "feelslike"
        case uvIndex = "uv_index"
        case visibility
        case isDay = "is_day"
    }
}
