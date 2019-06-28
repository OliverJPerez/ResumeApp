//
//  Models.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/14/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

// MARK: - Profile
struct Profile: Codable {
    let name: String
    let summary: String
    let profilePicURL: String
    let sections: [Section]
}

// MARK: - Section
struct Section: Codable {
    let title: String
    let summary: String?
    let workPlaces: [WorkPlace]?
    let skills: [Skill]?
}

// MARK: - Skill
struct Skill: Codable {
    let name: String
    let score: Int
}

// MARK: - WorkPlace
struct WorkPlace: Codable {
    let name, workPlaceDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case workPlaceDescription = "description"
    }
}
