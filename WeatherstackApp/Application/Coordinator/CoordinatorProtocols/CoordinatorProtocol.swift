//
//  Coordinator.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import UIKit

protocol CoordinatorProtocol {
    
    func start()
    var navigationController: UINavigationController { get set }
}
