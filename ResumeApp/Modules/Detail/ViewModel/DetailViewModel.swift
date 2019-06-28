//
//  DetailViewModel.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/16/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: DetailViewModel
final class DetailViewModel {
    // MARK: - Interface properties
    var title = Observable("")
    var summary = Observable("")
    var bgColor = Observable(UIColor.white)
}
