//
//  AppCoordinator.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import Foundation

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    func showCityWeatherScreen(cityName: String)
}
