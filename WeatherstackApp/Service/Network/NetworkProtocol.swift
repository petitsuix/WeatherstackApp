//
//  NetworkProtocol.swift
//  WeatherstackApp
//
//  Created by Richardier on 02/06/2022.
//

import Foundation
import Alamofire

protocol NetworkRequests {
    func fetchData(query: String, completion: @escaping (Result<WeatherInfo, AFError>) -> Void)
}
