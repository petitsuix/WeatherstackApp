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
    let current: Current
//
//    enum CodingKeys: String, CodingKey {
//        case request
//        case location
//        case current
//    }
}

// MARK: - Current
struct Current: Codable {
    let observationTime: String
    let temperature, weatherCode: Int
    let weatherIcons: [String]
    let weatherDescriptions: [String]
    let windSpeed, windDegree: Int
    let windDir: String
    let pressure: Int
    let precip: Float
    let humidity, cloudcover: Int
    let feelslike, uvIndex, visibility: Int
    let isDay: String

    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temperature
        case weatherCode = "weather_code"
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
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        observationTime = try container.decode(String.self, forKey: .observationTime)
//        temperature = try container.decode(Int.self, forKey: .temperature)
//        weatherCode = try container.decode(Int.self, forKey: .weatherCode)
//        weatherIcons = try container.decode([String].self, forKey: .weatherIcons)
//        weatherDescriptions = try container.decode([String].self, forKey: .weatherDescriptions)
//        windSpeed = try container.decode(Int.self, forKey: .windSpeed)
//        windDegree = try container.decode(Int.self, forKey: .windDegree)
//        windDir = try container.decode(String.self, forKey: .weatherCode)
//        pressure = try container.decode(Int.self, forKey: .pressure)
//        precip = try container.decode(Int.self, forKey: .precip)
//        humidity = try container.decode(Int.self, forKey: .humidity)
//        cloudcover = try container.decode(Int.self, forKey: .cloudcover)
//        feelslike = try container.decode(Int.self, forKey: .feelslike)
//        uvIndex = try container.decode(Int.self, forKey: .uvIndex)
//        visibility = try container.decode(Int.self, forKey: .visibility)
//        isDay = try container.decode(String.self, forKey: .isDay)
//    }
}

// MARK: - Location
struct Location: Codable {
    let name, country, region, lat: String
    let lon, timezoneID, localtime: String
    let localtimeEpoch: Int
    let utcOffset: String

    enum CodingKeys: String, CodingKey {
        case name, country, region, lat, lon
        case timezoneID = "timezone_id"
        case localtime
        case localtimeEpoch = "localtime_epoch"
        case utcOffset = "utc_offset"
    }
}

// MARK: - Request
struct Request: Codable {
    let type, query, language, unit: String
}

extension WeatherInfo: Hashable, Equatable {
    static func == (lhs: WeatherInfo, rhs: WeatherInfo) -> Bool {
        return lhs.current.weatherCode == rhs.current.weatherCode
    }
    
    func hash(into hasher: inout Hasher) {}
}
