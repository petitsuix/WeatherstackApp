//
//  FakeData.swift
//  WeatherstackAppTests
//
//  Created by Richardier on 02/06/2022.
//

import Foundation
@testable import WeatherstackApp

final class FakeData {
    
    class FakeError: Error {}
    static let error = FakeError()
    
    static var weather: WeatherInfo {
        let weatherInfo = try! JSONDecoder().decode(WeatherInfo.self, from: weatherData)
        return weatherInfo
    }
    
    static var weatherData: Data {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "Weatherstack", withExtension: "json")
        return try! Data(contentsOf: url!)
    }
}
