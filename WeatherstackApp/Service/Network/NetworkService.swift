//
//  NetworkService.swift
//  WeatherstackApp
//
//  Created by Richardier on 30/05/2022.
//

import Alamofire

protocol NetworkRequests {
    func fetchData(query: String, completion: @escaping (Result<WeatherInfo, AFError>) -> Void)
}

final class NetworkService {
    
    private let session: Session
    private let baseUrl = "http://api.weatherstack.com/current?"
    private let accessKey = "access_key=\(weatherstackApiKey)"
    private let queryParameter = "&query="
    
    init(session: Session = .default) {
        self.session = session
    }
}

extension NetworkService: NetworkRequests {
    func fetchData(query: String, completion: @escaping (Result<WeatherInfo, AFError>) -> Void) {
        let url = baseUrl + accessKey + queryParameter + query
        print(url)
        session.request(url).validate().responseDecodable(of: WeatherInfo.self) { (response) in
            completion(response.result)
        }
    }
}
