//
//  ProfileViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Oliver Jordy Perez Escamilla on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ProfileViewControllerUnitTests: XCTestCase {

    func testUserImageViewExists() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.profileImage)
    }
    
    func testUserNameLabelExists() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.userName)
    }
    
    func testSummaryTextViewExists() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.summary)
    }
    
    func testProfileSectionTableExists() {
        // given
        let sut = ProfileViewController.instantiate(from: StoryboardNames.profile)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.sectionsTable)
    }
    
}
