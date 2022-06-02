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
}

extension WeatherInfo: Hashable, Equatable {
    static func == (lhs: WeatherInfo, rhs: WeatherInfo) -> Bool {
        return lhs.current.weatherCode == rhs.current.weatherCode
    }
    
    func hash(into hasher: inout Hasher) {}
}
