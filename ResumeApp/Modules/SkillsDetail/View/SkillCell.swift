//
//  SkillCell.swift
//  ResumeApp
//
//  Created by OliverPérez on 6/17/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: SkillCell
final class SkillCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var skillName: UILabel?
    @IBOutlet weak var star1: UIImageView?
    @IBOutlet weak var star2: UIImageView?
    @IBOutlet weak var star3: UIImageView?
    @IBOutlet weak var star4: UIImageView?
    @IBOutlet weak var star5: UIImageView?
    
    // MARK: - Interface properties
    var stars = [UIImageView]()
    var viewModel: SkillCellViewModel? {
        // Binds to view model using observer pattern
        didSet {
            skillName?.text = viewModel?.skillName
            score = viewModel?.score ?? 0
            backgroundColor = viewModel?.backgroundColor
        }
    }
    var score = Int() {
        /// Sets the stars images according to the score
        didSet {
            for index in 0..<score {
                stars[index].image = UIImage(named: "star")
            }
        }
    }
    
    // MARK: - Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let star1 = star1, let star2 = star2, let star3 = star3, let star4 = star4, let star5 = star5 else {
            return
        }
        stars.append(star1)
        stars.append(star2)
        stars.append(star3)
        stars.append(star4)
        stars.append(star5)
    }
}
