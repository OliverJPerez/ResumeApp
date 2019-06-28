//
//  SkillsDetailViewModel.swift
//  ResumeApp
//
//  Created by OliverPérez on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

import UIKit

// MARK: SkillsDetailViewModel
final class SkillsDetailViewModel: CustomTableViewColors {
    
    // MARK: - Interface properties
    var title = Observable("")
    var bgColor = Observable(UIColor.white)
    var tableViewBgColor = UIColor()
    var reloadTableViewClosure: (()->())?
    var skills: [Skill] = [] {
        didSet {
            prepareView(with: skills)
        }
    }
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    // MARK: - Private properties
    private var cellViewModels = [SkillCellViewModel]() {
        didSet {
            reloadTableViewClosure?()
        }
    }
    
    // MARK: - Interface methods
    /// Prepares the information to be shown by the skills view controller
    ///
    /// - Parameters:
    ///   - skillsInfo: The skills information of the profile
    func prepareView(with skillsInfo: [Skill]) {
        var cellVMs = [SkillCellViewModel]()
        
        for (index, skill) in skills.enumerated() {
            let cellBgColor = getCellBackgroundColor(row: index, numberOfRows: skills.count)
            tableViewBgColor = updateTableViewColor(lastCellColor: cellBgColor)
            cellVMs.append(self.createCellViewModel(name: skill.name, score: skill.score, bgColor: cellBgColor))
        }
        self.cellViewModels = cellVMs
    }
    
    /// Returns the correspondant cell view model
    ///
    /// - Parameters:
    ///   - indexPath: The cell index path
    func getCellViewModel(at indexPath: IndexPath ) -> SkillCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    // MARK: - Private methods
    /// Returns a new section cell view model instance
    ///
    /// - Parameters:
    ///   - name: The title of the cell
    ///   - score: The number of stars
    ///   - bgView: The background view of the cell used to highlight the cell when selected
    private func createCellViewModel(name: String, score: Int, bgColor:UIColor) -> SkillCellViewModel {
        return SkillCellViewModel(skillName: name, score: score, backgroundColor: bgColor)
    }
}
