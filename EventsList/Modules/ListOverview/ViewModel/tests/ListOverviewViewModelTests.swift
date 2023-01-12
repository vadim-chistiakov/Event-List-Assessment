//
//  ListOverviewViewModelTests.swift
//  EventsListTests


import XCTest
@testable import EventsList

class ListOverviewViewModelTests: XCTestCase {
    
    var viewModel: ListOverviewViewModel!

    override func setUpWithError() throws {
        viewModel = ListOverviewViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialState() throws {
        XCTAssertTrue(viewModel.events.isEmpty)
    }
}
