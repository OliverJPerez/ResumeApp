//
//  SkillsControllerIntegrationTests.swift
//  ResumeAppTests
//
//  Created by OliverPérez on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class SkillsControllerIntegrationTests: XCTestCase {

    func testSkillsTableCustomCellIsNotNil() {
        // given
        let sut = SkillsDetailViewController.instantiate(from: StoryboardNames.skills)
        let dummySkill = Skill(name: "Testing", score: 4)
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.skills = [dummySkill]
        // then
        let indexPath = IndexPath(item: 0, section: 0)
        guard let skillsTable = sut.skillsTable else {
            XCTFail("The skills table view is nil")
            return
        }
        let cell = sut.tableView(skillsTable, cellForRowAt: indexPath) as? SkillCell
        XCTAssertNotNil(cell)
    }
    
    func testSkillsTableHasCorrectRowCount() {
        // given
        let sut = SkillsDetailViewController.instantiate(from: StoryboardNames.skills)
        let dummySkill = Skill(name: "Testing", score: 4)
        let numberOfSkills = 3
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.skills = [Skill](repeating: dummySkill, count: numberOfSkills)
        guard let skillsTable = sut.skillsTable else {
            XCTFail("The skills table view is nil")
            return
        }
        let rowCount = sut.tableView(skillsTable, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, numberOfSkills)
    }
    
    func testSkillsCellHasCorrectTitle() {
        // given
        let sut = SkillsDetailViewController.instantiate(from: StoryboardNames.skills)
        let dummySkill = Skill(name: "Testing", score: 4)
        let dummySkills =  [Skill](repeating: dummySkill, count: 3)
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.skills = dummySkills
        // then
        for (index, skill) in dummySkills.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            
            guard let skillsTable = sut.skillsTable else {
                XCTFail("The skills table view is nil")
                return
            }

            guard let cell = sut.tableView(skillsTable, cellForRowAt: indexPath) as? SkillCell else {
                XCTFail("The skill cell is nil")
                return
            }
            guard let skillName = cell.skillName else {
                XCTFail("The skill name label is nil")
                return
            }
            XCTAssertEqual(skillName.text, skill.name)
        }
    }
    
    func testSkillsTableCellHasCorrectNumberOfStars() {
        // given
        let sut = SkillsDetailViewController.instantiate(from: StoryboardNames.skills)
        let dummySkill1 = Skill(name: "Swift", score: 1)
        let dummySkill2 = Skill(name: "Xcode", score: 2)
        let dummySkill3 = Skill(name: "Testing", score: 3)
        let dummySkill4 = Skill(name: "Debugging", score: 4)
        let dummySkill5 = Skill(name: "Git", score: 5)
        // when
        sut.loadViewIfNeeded()
        sut.viewModel.skills = [dummySkill1, dummySkill2, dummySkill3, dummySkill4, dummySkill5]
        // then
        for index in 0..<sut.viewModel.skills.count {
            let indexPath = IndexPath(item: index, section: 0)
            
            guard let skillsTable = sut.skillsTable else {
                XCTFail("The skills table view is nil")
                return
            }
            
            let cell = sut.tableView(skillsTable, cellForRowAt: indexPath) as? SkillCell
            var starsImages = 0
            for star in cell?.stars ?? [] {
                if star.image != nil {
                    starsImages += 1
                }
            }
            XCTAssertEqual(starsImages, cell?.score)
        }
    }

}
