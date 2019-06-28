//
//  DetailViewUnitTests.swift
//  ResumeAppTests
//
//  Created by OliverPérez on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class DetailViewUnitTests: XCTestCase {

    func testTitleLabelExists() {
        // given
        let sut = DetailViewController.instantiate(from: StoryboardNames.detail)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.titleLabel)
    }
    
    func testSummaryTextViewExists() {
        // given
        let sut = DetailViewController.instantiate(from: StoryboardNames.detail)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.summary)
    }
   
}
