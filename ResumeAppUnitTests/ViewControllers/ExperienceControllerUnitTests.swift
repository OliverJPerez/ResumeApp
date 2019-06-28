//
//  ExperienceControllerUnitTests.swift
//  ResumeAppTests
//
//  Created by OliverPérez on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ExperienceControllerUnitTests: XCTestCase {

    func testProfileSectionTableExists() {
        // given
        let sut = ExperienceDetailViewController.instantiate(from: StoryboardNames.experience)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.workPlacesTable)
    }
   
}
