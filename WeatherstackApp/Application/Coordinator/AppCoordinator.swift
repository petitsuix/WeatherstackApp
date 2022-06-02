//
//  AppCoordinator.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import Foundation
import UIKit

class AppCoordinator: CoordinatorProtocol, AppCoordinatorProtocol {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    private let networkService: NetworkRequests
    
    //MARK: - Methods
    
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
        let cityWeatherViewModel = WeatherViewModel(coordinator: self, networkService: networkService)
        cityWeatherViewModel.viewDelegate = cityWeatherViewController
        cityWeatherViewController.viewModel = cityWeatherViewModel
        navigationController.pushViewController(cityWeatherViewController, animated: true)
    }
}
