//
//  ExperienceControllerIntegrationTests.swift
//  ResumeAppTests
//
//  Created by OliverPérez on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ExperienceControllerIntegrationTests: XCTestCase {
    
    func testProfileSectionTableHasCorrectRowCount() {
        // given
        let sut = ExperienceDetailViewController.instantiate(from: StoryboardNames.experience)
        let dummyWorkPlace = WorkPlace(name: "Globant", workPlaceDescription: "A great place to work")
        let numberOfSections = 3
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.workPlaces = [WorkPlace](repeating: dummyWorkPlace, count: numberOfSections)
        // then
        guard let workPlacesTable = sut.workPlacesTable else {
            XCTFail("The workPlaces table view is nil")
            return
        }
        let rowCount = sut.tableView(workPlacesTable, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, numberOfSections)
    }
    
    func testWorkPlacesTableCellHasDisclosureIndicators() {
        // given
        let sut = ExperienceDetailViewController.instantiate(from: StoryboardNames.experience)
        let dummyWorkPlace = WorkPlace(name: "Globant", workPlaceDescription: "A great place to work")
        let numberOfSections = 3
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.workPlaces = [WorkPlace](repeating: dummyWorkPlace, count: numberOfSections)
        // then
        for index in 0..<sut.viewModel.workPlaces.count {
            let indexPath = IndexPath(item: index, section: 0)
            
            guard let workPlacesTable = sut.workPlacesTable else {
                XCTFail("The workPlaces table view is nil")
                return
            }
            let cell = sut.tableView(workPlacesTable, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testWorkPlacesShowsDetailView() {
        //given
        let sut = ExperienceDetailViewController.instantiate(from: StoryboardNames.experience)
        let dummyWorkPlace = WorkPlace(name: "Globant", workPlaceDescription: "A great place to work")
        let selectedIndex = IndexPath(row: 0, section: 0)
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        let numberOfSections = 1
        sut.viewModel.sendInfo = { title, summary in
            flowCoordinator.showDetail(title: title, summary: summary, bgColor: UIColor.white)
        }
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.workPlaces = [WorkPlace](repeating: dummyWorkPlace, count: numberOfSections)
        sut.viewModel.sendInfo(dummyWorkPlace.name, dummyWorkPlace.workPlaceDescription)
        
        guard let workPlacesTable = sut.workPlacesTable else {
            XCTFail("The workPlaces table view is nil")
            return
        }
        sut.tableView(workPlacesTable, didSelectRowAt: selectedIndex)
        // create an expectation…
        let expectation = XCTestExpectation(description: "Selecting a table view cell shows Detail View")
        // …then fulfill it asynchronously
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(navigationController.topViewController is DetailViewController)
    }
    
}
