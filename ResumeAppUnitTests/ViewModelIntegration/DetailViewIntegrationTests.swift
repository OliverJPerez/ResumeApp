//
//  DetailViewIntegrationTests.swift
//  ResumeAppTests
//
//  Created by OliverPérez on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class DetailViewIntegrationTests: XCTestCase {

    func testDetailViewHasCorrectTitle() {
        // given
        let sut = DetailViewController.instantiate(from: StoryboardNames.detail)
        let testTitle = "About"
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.title.value = testTitle
        // then
        guard let titleLabel = sut.titleLabel else {
            XCTFail("The title label is nil")
            return
        }
        XCTAssertEqual(titleLabel.text, testTitle)
    }
    
    func testDetailViewHasCorrectSummary() {
        // given
        let sut = DetailViewController.instantiate(from: StoryboardNames.detail)
        let testSummary = "Hello, this is about me."
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.summary.value = testSummary
        // then
        guard let summary = sut.summary else {
            XCTFail("The summary text view is nil")
            return
        }
        XCTAssertEqual(summary.text, testSummary)
    }
    
}
