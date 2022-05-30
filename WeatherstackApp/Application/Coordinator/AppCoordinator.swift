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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeScreen()
    }
    
    func showHomeScreen() {
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: false)
    }
}
