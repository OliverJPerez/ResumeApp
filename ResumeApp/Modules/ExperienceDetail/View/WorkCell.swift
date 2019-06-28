//
//  WorkplaceCell.swift
//  ResumeApp
//
//  Created by OliverPérez on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//
import UIKit

// MARK: WorkCell
final class WorkCell: UITableViewCell {
    
    // MARK: - Interface properties
    var viewModel: WorkCellViewModel? {
        // Binds to view model using observer pattern
        didSet {
            textLabel?.text = viewModel?.title
            textLabel?.textColor = UIColor.white
            backgroundColor = viewModel?.backgroundColor
            if let bgView = viewModel?.cellBackgroundView {
                selectedBackgroundView = bgView
            }
        }
    }
}
