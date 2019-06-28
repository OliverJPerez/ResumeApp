//
//  ProfileViewController+Extensions.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: ProfileViewController table view data source extension
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as? SectionCell else {
            fatalError("Cell not exists in storyboard")
        }
        cell.viewModel = viewModel.getCellViewModel(at: indexPath)
        tableView.backgroundColor = viewModel.tableViewBgColor
        return cell
    }
}
