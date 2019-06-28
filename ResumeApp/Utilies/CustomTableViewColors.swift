//
//  ColorDesigner.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit
// MARK: - CustomTableViewColors
/// Defines customization methods for the table view and its cells
protocol CustomTableViewColors {
    func getCellBackgroundColor(row: Int, numberOfRows: Int) -> UIColor
    func updateTableViewColor(lastCellColor color: UIColor) -> UIColor
}

// MARK: - CustomTableViewColors Extensions
extension CustomTableViewColors {
    
    /// Returns a color for the background cell according to its row in the table view
    ///
    /// - Parameters:
    ///   - index: The row of the cell
    ///   - numberOfRows: The number of rows of the table view
    func getCellBackgroundColor(row: Int, numberOfRows: Int) -> UIColor {
        let baseBgColor = UIColor(named: "CustomBlue") ?? UIColor.white
        let colorFactor = CGFloat(row+1)/CGFloat(numberOfRows * 3)
        let newRed = baseBgColor.rgba.red + colorFactor
        let newGreen = baseBgColor.rgba.green + colorFactor
        let newBlue = baseBgColor.rgba.blue + colorFactor
        return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1)
    }
    /// Updates the table view background color according to the color of the last cell
    ///
    /// - Parameters:
    ///   - lastCellColor: The UIColor of the last cell in table view
    func updateTableViewColor(lastCellColor color: UIColor) -> UIColor {
        let colorFactor = CGFloat(0.05)
        return UIColor(red: color.rgba.red + colorFactor, green: color.rgba.green + colorFactor, blue: color.rgba.blue + colorFactor, alpha: 1.0)
    }
}
