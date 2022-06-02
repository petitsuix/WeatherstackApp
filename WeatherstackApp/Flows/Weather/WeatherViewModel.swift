//
//  WeatherViewModel.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import Foundation


class WeatherViewModel {
    
    //MARK: - Properties
    
    weak var viewDelegate: WeatherViewModelDelegate?
    
    var weatherInfo: WeatherInfo? {
        didSet {
            guard let data = weatherInfo else { return }
            viewDelegate?.didFetchWeatherData(weatherData: data)
        }
    }
    
    private let networkService: NetworkRequests
    private let coordinator: AppCoordinatorProtocol
    
    //MARK: - Methods
    
    init(coordinator: AppCoordinatorProtocol, networkService: NetworkRequests) {
        self.coordinator = coordinator
        self.networkService = networkService
    }
    
    func fetchWeather(for cityName: String) {
        viewDelegate?.presentLoadingState()
        networkService.fetchData(query: cityName) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherInfo):
                    self.weatherInfo = weatherInfo
                case .failure(let error):
                    print("Error fetching weather data: \(error.localizedDescription)")
                    self.viewDelegate?.presentErrorState()
                }
            }
        }
    }
}
