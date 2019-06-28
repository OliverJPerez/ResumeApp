//
//  FlorCoordinatorUnitTests.swift
//  ResumeAppTests
//
//  Created by Oliver Jordy Perez Escamilla on 6/19/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import XCTest
@testable import ResumeApp

class FlowCoordinatorUnitTests: XCTestCase {
    
    func testFlowCoorinatorRoutesToDetailView() {
        // given
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        let dummyDetailSection = Section(title: "About", summary: "This is me", workPlaces: nil, skills: nil)
      
        // when
        flowCoordinator.routeToView(for: dummyDetailSection, with: UIColor.white)
   
        // then
        XCTAssertTrue(navigationController.topViewController is DetailViewController)
    }
    
    func testFlowCoorinatorRoutesToSkillDetailView() {
        // given
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        let dummySkill = Skill(name: "Testing", score: 4)
        let dummySection = Section(title: "Skills", summary: "", workPlaces: nil, skills: [dummySkill])
        
        // when
        flowCoordinator.routeToView(for: dummySection, with: UIColor.white)
   
        // then
        XCTAssertTrue(navigationController.topViewController is SkillsDetailViewController)
    }
    
    func testFlowCoorinatorRoutesToExperienceDetailView() {
        // given
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        let dummyWorkPlace = WorkPlace(name: "Globant", workPlaceDescription: "Great place to work")
        let dummySection = Section(title: "Work Places", summary: "", workPlaces: [dummyWorkPlace], skills: nil)
        
        // when
        flowCoordinator.routeToView(for: dummySection, with: UIColor.white)
  
        // then
        XCTAssertTrue(navigationController.topViewController is ExperienceDetailViewController)
    }
    
    func testFlowCoorinatorShowsDetailView() {
        // given
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        
        // when
        flowCoordinator.showDetail(title: "About", summary: "This is me", bgColor: UIColor.white)
     
        // then
        XCTAssertTrue(navigationController.topViewController is DetailViewController)
    }
    
    func testFlowCoorinatorShowsSkillDetailView() {
        // given
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        let dummySkill = Skill(name: "Testing", score: 4)
        
        // when
        flowCoordinator.showSkillsDetail(title: "Skills", skills: [dummySkill], bgColor: UIColor.white)
     
        // then
        XCTAssertTrue(navigationController.topViewController is SkillsDetailViewController)
    }
    
    func testFlowCoorinatorShowsExperienceDetailView() {
        // given
        let navigationController = UINavigationController()
        let flowCoordinator = FlowCoordinator(navigationController: navigationController)
        let dummyWorkPlace = WorkPlace(name: "Globant", workPlaceDescription: "Great place to work")
        
        // when
        flowCoordinator.showExperienceDetail(title: "Experience", workPlaces: [dummyWorkPlace], bgColor: UIColor.white)
        
        // then
        XCTAssertTrue(navigationController.topViewController is ExperienceDetailViewController)
    }
}
