//
//  ViewController.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/14/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: ProfileViewController
final class ProfileViewController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userName: UILabel?
    @IBOutlet weak var profileImage: UIImageView?
    @IBOutlet weak var summary: UITextView?
    @IBOutlet weak var sectionsTable: UITableView?
    @IBOutlet weak var emptyStateView: UIView?
    
    // MARK: - Interface Properties
    var viewModel = ProfileViewModel()
    
    // MARK: - Life cicyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewsToViewModel()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        profileImage?.layer.cornerRadius = (profileImage?.bounds.height ?? 0) / 2
    }
    
    // MARK: - Private methods
    /// Sets the initial configuration of the table view
    private func setTableView() {
        sectionsTable?.dataSource = self
        sectionsTable?.delegate = self
        sectionsTable?.separatorStyle = .none
        sectionsTable?.bind(to: viewModel.isTableViewHidden)
        viewModel.reloadTableViewClosure = { [weak self] in
            self?.sectionsTable?.reloadData()
        }
    }
    
    /// Binds the view elements to the view model
    private func bindViewsToViewModel() {
        bind(to: viewModel.viewTitle)
        userName?.bind(to: viewModel.name)
        summary?.bind(to: viewModel.summary)
        profileImage?.bind(to: viewModel.profileImage)
        emptyStateView?.bind(to: viewModel.isEmptyViewHidden)
    }
    
    // MARK: - IBActions
    @IBAction func reloadPressed(_ sender: Any) {
        viewModel.setViewModelWithServiceResponse()
    }
}
