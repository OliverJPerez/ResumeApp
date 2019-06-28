//
//  ExperienceDetailViewModel.swift
//  ResumeApp
//
//  Created by OliverPérez on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: ExperienceDetailViewModel
final class ExperienceDetailViewModel: CustomTableViewColors {
    
    // MARK: - Interface properties
    var title = Observable("")
    var bgColor = Observable(UIColor.white)
    var reloadTableViewClosure: (()->())?
    var tableViewBgColor = UIColor()
    var sendInfo: (String, String) -> Void = { _,_ in }
    var workPlaces: [WorkPlace] = [] {
        didSet {
            prepareView(with: workPlaces)
        }
    }
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    // MARK: - Private properties
    private var cellViewModels = [WorkCellViewModel]() {
        didSet {
            reloadTableViewClosure?()
        }
    }
    
    // MARK: - Interface methods
    /// Prepares the information to be shown by the experience view controller
    ///
    /// - Parameters:
    ///   - workPlacesInfo: The information of the work places
    func prepareView(with workPlacesInfo: [WorkPlace]) {
        var cellVMs = [WorkCellViewModel]()
        let selectedCellBg = UIView()
        selectedCellBg.backgroundColor = UIColor(named: "SelectedCell") ?? UIColor.gray
        
        for (index, workPlace) in workPlacesInfo.enumerated() {
            let cellBgColor = getCellBackgroundColor(row: index, numberOfRows: workPlaces.count)
            tableViewBgColor = updateTableViewColor(lastCellColor: cellBgColor)
            cellVMs.append(self.createCellViewModel(name: workPlace.name, summary: workPlace.workPlaceDescription, bgColor: cellBgColor, bgView: selectedCellBg))
        }
        self.cellViewModels = cellVMs
    }
    
    /// Sends the information of the tapped cell
    ///
    /// - Parameters:
    ///   - index: The row of the tapped cell
    func SendTappedCellInfo(at index: Int) {
        let workPlace = workPlaces[index]
        sendInfo(workPlace.name, workPlace.workPlaceDescription)
    }
    
    /// Returns the correspondant cell view model
    ///
    /// - Parameters:
    ///   - indexPath: The cell index path
    func getCellViewModel(at indexPath: IndexPath ) -> WorkCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    // MARK: - Private methods
    /// Returns a new section cell view model instance
    ///
    /// - Parameters:
    ///   - name: The title of the cell
    ///   - summary: The summary description of the work place experience
    ///   - bgColor: The background color of the cell
    ///   - bgView: The background view of the cell used to highlight the cell when selected
    private func createCellViewModel(name: String, summary: String, bgColor: UIColor, bgView: UIView) -> WorkCellViewModel {
        return WorkCellViewModel(title: name, summary: summary, backgroundColor: bgColor, cellBackgroundView: bgView)
    }
}
