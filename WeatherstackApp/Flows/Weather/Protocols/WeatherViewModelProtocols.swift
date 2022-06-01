//
//  WeatherViewModelProtocol.swift
//  WeatherstackApp
//
//  Created by Richardier on 01/06/2022.
//

import Foundation

protocol WeatherViewModelDelegate: AnyObject {
    func presentLoadingState()
    func presentErrorState()
    func didFetchWeatherData()
}

protocol WeatherViewModelProtocol: AnyObject {
    var viewDelegate: WeatherViewModelDelegate? { get set }
    var weatherInfo: WeatherInfo { get }
    func fetchWeather(for cityName: String)
}
