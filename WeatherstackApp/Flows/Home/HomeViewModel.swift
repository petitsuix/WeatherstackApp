//
//  HomeViewModel.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import Foundation

class HomeViewModel {
    
    //MARK: - Properties
    
    weak var viewDelegate: HomeViewController?
    
    private let coordinator: AppCoordinatorProtocol
    
    //MARK: - Methods
    
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func showCityWeatherScreen(cityName: String) {
        coordinator.showCityWeatherScreen(cityName: cityName)
    }
}
