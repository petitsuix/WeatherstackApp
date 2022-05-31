//
//  WeatherViewModel.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

class WeatherViewModel {
    
    weak var viewDelegate: WeatherViewController?
    
    private let coordinator: AppCoordinatorProtocol
    
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func fetchWeather() {
        
    }
}
