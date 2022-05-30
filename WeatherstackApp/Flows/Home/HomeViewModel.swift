//
//  HomeViewModel.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

class HomeViewModel {
    
    weak var viewDelegate: HomeViewController?
    
    private let coordinator: AppCoordinatorProtocol
    
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func showCityWeatherScreen() {
        coordinator.showCityWeatherScreen()
    }
}
