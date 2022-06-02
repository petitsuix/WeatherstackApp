//
//  NetworkRequestsMock.swift
//  WeatherstackAppTests
//
//  Created by Richardier on 02/06/2022.
//

import Alamofire
import Foundation
@testable import WeatherstackApp

class NetworkRequestsMock: NetworkRequests {
    
    var fetchDataCalled = false
    func fetchData(query: String, completion: @escaping (Result<WeatherInfo, AFError>) -> Void) {
        fetchDataCalled = true
    }
}
