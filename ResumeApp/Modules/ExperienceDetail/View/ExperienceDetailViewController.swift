//
//  ExperienceDetailViewController.swift
//  ResumeApp
//
//  Created by OliverPérez on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: ExperienceDetailViewController
final class ExperienceDetailViewController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var workPlacesTable: UITableView?
    
    // MARK: - Interface properties
    var viewModel = ExperienceDetailViewModel()
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewElements()
        setTableView()
    }
    
    // MARK: Private Methods
    /// Binds the view elements to the view model
    private func bindViewElements() {
        bind(to: viewModel.title)
        view.bind(to: viewModel.bgColor)
    }
    
    /// Sets the initial configuration of the table view
    private func setTableView() {
        workPlacesTable?.dataSource = self
        workPlacesTable?.delegate = self
        workPlacesTable?.separatorStyle = .none
        viewModel.reloadTableViewClosure = { [weak self] in
            self?.workPlacesTable?.reloadData()
        }
    }
}

