//
//  ModelLayerTests.swift
//  ResumeAppTests
//
//  Created by OliverPérez on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ModelLayerTests: XCTestCase {
    
    func testProfileModelDecodesJsonWithSuccess() {
        // given
        let testBundle = Bundle(for: type(of: self))
        let jsonDecoder = JSONDecoder()
        guard let path = testBundle.path(forResource: "oliverProfile", ofType: "json") else {
            XCTFail("Invaild data path")
            return
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            XCTFail("Invaild test raw data")
            return
        }
        //when
        guard let profile: Profile = try? jsonDecoder.decode(Profile.self, from: data) else {
        // then
            XCTFail("Invaild Model")
            return
        }
        XCTAssertNotNil(profile)
    }
    
    func testSectionModelDecodesJsonWithSuccess() {
        // given
        let testBundle = Bundle(for: type(of: self))
        let jsonDecoder = JSONDecoder()
        guard let path = testBundle.path(forResource: "SectionModel", ofType: "json") else {
            XCTFail("Invaild data path")
            return
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            XCTFail("Invaild test raw data")
            return
        }
        //when
        guard let section: Section = try? jsonDecoder.decode(Section.self, from: data) else {
            // then
            XCTFail("Invaild Model")
            return
        }
        XCTAssertNotNil(section)
    }
    
    func testSkillModelDecodesJsonWithSuccess() {
        // given
        let testBundle = Bundle(for: type(of: self))
        let jsonDecoder = JSONDecoder()
        guard let path = testBundle.path(forResource: "SkillModel", ofType: "json") else {
            XCTFail("Invaild data path")
            return
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            XCTFail("Invaild test raw data")
            return
        }
        //when
        guard let skill: Skill = try? jsonDecoder.decode(Skill.self, from: data) else {
            // then
            XCTFail("Invaild Model")
            return
        }
        XCTAssertNotNil(skill)
    }
    
    
    func testWorkPlacesModelDecodesJsonWithSuccess() {
        // given
        let testBundle = Bundle(for: type(of: self))
        let jsonDecoder = JSONDecoder()
        guard let path = testBundle.path(forResource: "WorkPlaceModel", ofType: "json") else {
            XCTFail("Invaild data path")
            return
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            XCTFail("Invaild test raw data")
            return
        }
        //when
        guard let workPlace: WorkPlace = try? jsonDecoder.decode(WorkPlace.self, from: data) else {
            // then
            XCTFail("Invaild Model")
            return
        }
        XCTAssertNotNil(workPlace)
    }
    
}
