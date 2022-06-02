//
//  WeatherstackAppTests.swift
//  WeatherstackAppTests
//
//  Created by Richardier on 30/05/2022.
//

import XCTest
@testable import WeatherstackApp

class WeatherViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var viewModel: WeatherViewModel!
    var coordinatorMock: CoordinatorMock!
    var networkServiceMock: NetworkRequestsMock!
    
    //MARK: - setUp & tearDown methods

    override func setUpWithError() throws {
        super.setUp()
        coordinatorMock = CoordinatorMock()
        networkServiceMock = NetworkRequestsMock()
        viewModel = WeatherViewModel(coordinator: coordinatorMock, networkService: networkServiceMock)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    // MARK: - Tests
    
    func testCallFetchDataMethod() {
        XCTAssertFalse(networkServiceMock.fetchDataCalled)
        viewModel.fetchWeather(for: "")
        XCTAssertTrue(networkServiceMock.fetchDataCalled)
    }
}
