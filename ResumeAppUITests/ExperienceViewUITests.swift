//
//  ExperienceViewUITests.swift
//  ResumeAppUITests
//
//  Created by OliverPérez on 6/20/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest

class ExperienceViewUITests: XCTestCase {

    // MARK: - Properties
    let app = XCUIApplication()
    
    // MARK: - Set up
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    // MARK: - UITests
    func testNavigationBackButtonExists() {
        let app = XCUIApplication()
        let profileViewTitle = NSLocalizedString(LocalizedKeys.profile.rawValue, comment: "The profile view title")
        app.tables.staticTexts["Experience"].tap()
        XCTAssertTrue(app.navigationBars.firstMatch.buttons[profileViewTitle].exists)
    }
    
    func testTableHaveAtLeastOneWorkPlace() {
        let app = XCUIApplication()
        app.tables.staticTexts["Experience"].tap()
        XCTAssertGreaterThanOrEqual(app.tables.cells.count, 1)
    }
}
