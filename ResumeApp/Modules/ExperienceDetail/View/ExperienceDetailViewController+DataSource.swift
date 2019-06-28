//
//  ExperienceDetailViewController+DataSource.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: ExperienceDetailViewController data source extensions
extension ExperienceDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkCell") as? WorkCell else {
            fatalError("Cell not exists in storyboard")
        }
        cell.viewModel = viewModel.getCellViewModel(at: indexPath)
        tableView.backgroundColor = viewModel.tableViewBgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
