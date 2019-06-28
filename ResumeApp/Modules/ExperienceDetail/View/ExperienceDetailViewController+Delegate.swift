//
//  ExperienceDetailViewController+Delegate.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: ExperienceDetailViewController delegate extensions
extension ExperienceDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.SendTappedCellInfo(at: indexPath.row)
    }
}
