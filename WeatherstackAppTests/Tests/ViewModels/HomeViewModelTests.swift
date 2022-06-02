//
//  HomeViewModel.swift
//  WeatherstackAppTests
//
//  Created by Richardier on 02/06/2022.
//

import XCTest
@testable import WeatherstackApp

class HomeViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    var coordinatorMock: CoordinatorMock!
    
    //MARK: - setUp & tearDown methods

    override func setUpWithError() throws {
        super.setUp()
        coordinatorMock = CoordinatorMock()
        viewModel = HomeViewModel(coordinator: coordinatorMock)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    // MARK: - Tests
    
    func testCallFetchDataMethod() {
        XCTAssertFalse(coordinatorMock.showWeatherCityScreenCalled)
        viewModel.showCityWeatherScreen(cityName: "")
        XCTAssertTrue(coordinatorMock.showWeatherCityScreenCalled)
    }
}
