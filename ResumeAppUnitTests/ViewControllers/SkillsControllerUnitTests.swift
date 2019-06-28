//
//  SkillsControllerUnitTests.swift
//  ResumeAppTests
//
//  Created by OliverPérez on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class SkillsControllerUnitTests: XCTestCase {
    
    func testSkillsSectionTableExists() {
        // given
        let sut = SkillsDetailViewController.instantiate(from: StoryboardNames.skills)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.skillsTable)
    }
    
}
