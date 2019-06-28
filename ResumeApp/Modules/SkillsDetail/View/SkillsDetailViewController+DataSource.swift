//
//  SkillsDetailViewController+DataSource.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: SkillsDetailViewController table data source extensions
extension SkillsDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCell") as? SkillCell else {
            fatalError("Cell not exists in storyboard")
        }
        tableView.backgroundColor = viewModel.tableViewBgColor
        cell.viewModel = viewModel.getCellViewModel(at: indexPath)
        return cell
    }
}
