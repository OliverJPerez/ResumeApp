//
//  ResumeAppUITests.swift
//  ResumeAppUITests
//
//  Created by OliverPérez on 6/20/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest

class ProfileViewUITests: XCTestCase {
    // MARK: - Properties
    let app = XCUIApplication()
    
    // MARK: - Set up
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    // MARK: - UITests
    func testProfilePhotoImageViewExists() {
        XCTAssertTrue(app.images["Profile Picture"].exists)
    }
    
    func testProfileNameLabelExists() {
        XCTAssertTrue(app.staticTexts["Profile Name"].exists)
    }
    
    func testProfileSummaryExists() {
        XCTAssertTrue(app.textViews["Summary"].exists)
    }
    
    func testAllSectionsExists() {
        // Waits 3 seconds to download the sections
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: app.tables.staticTexts["About"], handler: nil)
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: app.tables.staticTexts["Experience"], handler: nil)
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith:
            app.tables.staticTexts["Hard Skills"], handler: nil)
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith:
            app.tables.staticTexts["Soft Skills"], handler: nil)
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith:
            app.tables.staticTexts["Soft Skills"], handler: nil)
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: app.tables.staticTexts["Hobbies"], handler: nil)
        
        waitForExpectations(timeout: 3, handler: nil)
    }

}
