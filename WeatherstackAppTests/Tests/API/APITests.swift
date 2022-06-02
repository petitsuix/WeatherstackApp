//
//  APITests.swift
//  WeatherstackAppTests
//
//  Created by Richardier on 02/06/2022.
//

import XCTest
import Alamofire
@testable import WeatherstackApp

class APITests: XCTestCase {

    // MARK: - Properties
    
    var session: Session!
    var networkService: NetworkRequests!
    
    // MARK: - setUp & tearDown Methods
    
    override func setUp() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolMock.self]
        session = Session(configuration: configuration)
        networkService = NetworkService(session: session)
    }
    
    override func tearDownWithError() throws {
        UrlProtocolMock.data = nil
        UrlProtocolMock.error = nil
    }
    
    // MARK: - Tests
    
    func testGetWeatherShouldPostFailedCompletionIfError() throws {
        let expectation = XCTestExpectation(description: "get weather") // Purpose is being able to wait for the request, operated asynchronously. Otherwise, the end of the test is read immediately without going through the completion.
        // Given :
        UrlProtocolMock.error = AFError.explicitlyCancelled
        // When :
        networkService.fetchData(query: "abcdefghij") { (result) in
            guard case .failure(let error) = result else {
                XCTFail("Missing failure error")
                return
            }
            // Then :
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testGetWeatherShouldWork() throws {
        let expectation = XCTestExpectation(description: "get weather")
        // Given :
        UrlProtocolMock.data = FakeData.weatherData
        // When :
        networkService.fetchData(query: "") { (result) in
            // Then :
            guard case .success(let weatherData) = result else {
                XCTFail("Missing success data")
                return
            }
            XCTAssertNotNil(weatherData)
            let weather = try! XCTUnwrap(weatherData, "missing weather")
            XCTAssertEqual(weather.location.name, "Paris")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}

