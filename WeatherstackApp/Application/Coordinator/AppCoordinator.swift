//
//  AppCoordinator.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import Foundation
import UIKit

class AppCoordinator: CoordinatorProtocol, AppCoordinatorProtocol {
    
    var navigationController: UINavigationController
    private let networkService: NetworkRequests
    
    
    
    init(navigationController: UINavigationController) {
        self.networkService = NetworkService()
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeScreen()
    }
    
    func showHomeScreen() {
        let homeViewController = HomeViewController()
        homeViewController.viewModel = HomeViewModel(coordinator: self)
        navigationController.setViewControllers([homeViewController], animated: false)
    }
    
    func showCityWeatherScreen(cityName: String) {
        let cityWeatherViewController = WeatherViewController(cityName: cityName)
        cityWeatherViewController.viewModel = WeatherViewModel(coordinator: self, networkService: networkService)
        navigationController.pushViewController(cityWeatherViewController, animated: true)
    }
}
