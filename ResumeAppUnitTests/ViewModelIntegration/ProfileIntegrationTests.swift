//
//  ProfileIntegrationTests.swift
//  ResumeAppTests
//
//  Created by Oliver Jordy Perez Escamilla on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

// Integration Tests with View Model
class ProfileIntegrationTests: XCTestCase {

    func testProfileViewHasCorrectTitle() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let testTitle = NSLocalizedString(LocalizedKeys.profile.rawValue, comment: "The title of the profile view controller")
        let dummyProfile = Profile(name: testTitle, summary: "", profilePicURL: "none", sections: [])
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.prepareView(with: dummyProfile)
        // then
        XCTAssertEqual(sut.title, testTitle)
    }
    
    func testProfileSectionTableHasCorrectRowCount() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let dummySection = Section(title: "", summary: nil, workPlaces: nil, skills: nil)
        let numberOfSections = 3
        let dummyProfile = Profile(name: "", summary: "", profilePicURL: "none", sections: [Section](repeating: dummySection, count: numberOfSections))
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.prepareView(with: dummyProfile)
        // then
        guard let sectionsTable = sut.sectionsTable else {
            XCTFail("The section table view is nil")
            return
        }
        let rowCount = sut.tableView(sectionsTable, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, numberOfSections)
    }
    
    func testProfileSectionTableCellHasCorrectTitle() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let dummySection = Section(title: "", summary: nil, workPlaces: nil, skills: nil)
        let numberOfSections = 3
        let dummyProfile = Profile(name: "Dummy Title", summary: "", profilePicURL: "none", sections: [Section](repeating: dummySection, count: numberOfSections))
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.prepareView(with: dummyProfile)
        // then
        for (index, section) in dummyProfile.sections.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            
            guard let sectionsTable = sut.sectionsTable else {
                XCTFail("The section table view is nil")
                return
            }
            let cell = sut.tableView(sectionsTable, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, section.title)
        }
    }
    
    func testProfileSectionTableCellHasDisclosureIndicators() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let dummySection = Section(title: "", summary: nil, workPlaces: nil, skills: nil)
        let numberOfSections = 3
        let dummyProfile = Profile(name: "Dummy Title", summary: "", profilePicURL: "none", sections: [Section](repeating: dummySection, count: numberOfSections))
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.prepareView(with: dummyProfile)
        // then
        for index in 0..<dummyProfile.sections.count {
            let indexPath = IndexPath(item: index, section: 0)
            
            guard let sectionsTable = sut.sectionsTable else {
                XCTFail("The section table view is nil")
                return
            }
            let cell = sut.tableView(sectionsTable, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testSelectingCellShowsDetailView() {
        //given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let dummySection = Section(title: "About", summary: "This is me", workPlaces: nil, skills: nil)
        let selectedIndex = IndexPath(row: 0, section: 0)
        let numberOfSections = 1
        let dummyProfile = Profile(name: "", summary: "", profilePicURL: "none", sections: [Section](repeating: dummySection, count: numberOfSections))
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        sut.viewModel.sendInfo = { detail, bgColor in
          flowCoordinator.routeToView(for: detail, with: bgColor)
        }
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.prepareView(with: dummyProfile)
        sut.viewModel.sendInfo(dummySection, UIColor.white)
        guard let sectionsTable = sut.sectionsTable else {
            XCTFail("The section table view is nil")
            return
        }
        sut.tableView(sectionsTable, didSelectRowAt: selectedIndex)
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
    
    func testSelectingCellShowsSkillsView() {
        //given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let dummySkill = Skill(name: "Testing", score: 5)
        let dummySection = Section(title: "Skills", summary: "This is me", workPlaces: nil, skills: [Skill](repeating: dummySkill, count: 1))
        let selectedIndex = IndexPath(row: 0, section: 0)
        let numberOfSections = 1
        let dummyProfile = Profile(name: "", summary: "", profilePicURL: "none", sections: [Section](repeating: dummySection, count: numberOfSections))
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        sut.viewModel.sendInfo = { detail, bgColor in
            flowCoordinator.routeToView(for: detail, with: bgColor)
        }
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.prepareView(with: dummyProfile)
        sut.viewModel.sendInfo(dummySection, UIColor.white)
        
        guard let sectionsTable = sut.sectionsTable else {
            XCTFail("The section table view is nil")
            return
        }
        sut.tableView(sectionsTable, didSelectRowAt: selectedIndex)
        // create an expectation…
        let expectation = XCTestExpectation(description: "Selecting a table view cell shows Skills Detail View")
        // …then fulfill it asynchronously
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(navigationController.topViewController is SkillsDetailViewController)
    }
    
    func testSelectingCellShowsExperienceView() {
        //given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let dummyWorkPlace = WorkPlace(name: "Globant", workPlaceDescription: "Great place to work")
        let dummySection = Section(title: "Skills", summary: "This is me", workPlaces: [WorkPlace](repeating: dummyWorkPlace, count: 1), skills: nil)
        let selectedIndex = IndexPath(row: 0, section: 0)
        let numberOfSections = 1
        let dummyProfile = Profile(name: "", summary: "", profilePicURL: "none", sections: [Section](repeating: dummySection, count: numberOfSections))
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        sut.viewModel.sendInfo = { detail, bgColor in
            flowCoordinator.routeToView(for: detail, with: bgColor)
        }
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.prepareView(with: dummyProfile)
        sut.viewModel.sendInfo(dummySection, UIColor.white)
        
        guard let sectionsTable = sut.sectionsTable else {
            XCTFail("The section table view is nil")
            return
        }
        sut.tableView(sectionsTable, didSelectRowAt: selectedIndex)
        // create an expectation…
        let expectation = XCTestExpectation(description: "Selecting a table view cell shows Skills Detail View")
        // …then fulfill it asynchronously
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(navigationController.topViewController is ExperienceDetailViewController)
    }
}
