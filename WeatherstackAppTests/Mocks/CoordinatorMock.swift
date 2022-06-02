//
//  CoordinatorMock.swift
//  Marvel_ComicsTests
//
//  Created by Richardier on 23/03/2022.
//

import Foundation
import UIKit
@testable import WeatherstackApp

class CoordinatorMock: AppCoordinatorProtocol {
    
    var navigationController = UINavigationController()
    
    var coordinatorStartCalled = false
    func start() {
        coordinatorStartCalled = true
    }
    
    var showWeatherCityScreenCalled = false
    func showCityWeatherScreen(cityName: String) {
        showWeatherCityScreenCalled = true
    }
}
