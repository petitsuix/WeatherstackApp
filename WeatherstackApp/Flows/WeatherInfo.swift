//
//  WeatherInfo.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import Foundation

// MARK: - WeatherInfo
struct WeatherInfo: Codable {
    let request: Request
    let location: Location
    let current: CurrentWeather
}

// MARK: - Current
struct CurrentWeather: Codable {
    let temperature: Int
    let weatherIcons: [String]
    let weatherDescriptions: [String]
    let windSpeed, windDegree: Int
    let windDir: String
    let pressure, precip, humidity, cloudcover: Int
    let feelslike, uvIndex, visibility: Int
    let isDay: String

    enum CodingKeys: String, CodingKey {
        case temperature
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressure, precip, humidity, cloudcover, feelslike
        case uvIndex = "uv_index"
        case visibility
        case isDay = "is_day"
    }
}

// MARK: - Location
struct Location: Codable {
    let name, country, region, latitude: String
    let longitude, localtime: String
    let utcOffset: String

    enum CodingKeys: String, CodingKey {
        case name, country, region, latitude, longitude
        case localtime
        case utcOffset = "utc_offset"
    }
}

// MARK: - Request
struct Request: Codable {
    let type, query, language, unit: String
}

extension WeatherInfo: Hashable, Equatable {
    static func == (lhs: WeatherInfo, rhs: WeatherInfo) -> Bool {
        return lhs.location.name == rhs.location.name
    }
    
    func hash(into hasher: inout Hasher) {}
}
