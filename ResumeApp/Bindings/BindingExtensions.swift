//
//  BindingClasses.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/16/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: - UILabel binding extension
extension UILabel {
    func bind(to observable: Observable<String>) {
        observable.valueChanged = { [weak self] newText in
            self?.text = newText
        }
    }
}

// MARK: - UIImageView binding extension
extension UIImageView {
    func bind(to observable: Observable<UIImage>) {
        observable.valueChanged = { [weak self] newImage in
            self?.image = newImage
        }
    }
}

// MARK: - UIView binding extension
extension UIView {
    func bind(to observable: Observable<UIColor>) {
        observable.valueChanged = { [weak self] newBgColor in
            self?.backgroundColor = newBgColor
        }
    }
    
    func bind(to observable: Observable<Bool>) {
        observable.valueChanged = { [weak self] isHidden in
            self?.isHidden = isHidden ?? false
        }
    }
}

// MARK: - UITextView binding extension
extension UITextView {
    func bind(to observable: Observable<String>) {
        observable.valueChanged = { [weak self] newText in
            self?.text = newText
        }
    }
}

// MARK: - UIViewController binding extension
extension UIViewController {
    func bind(to observable: Observable<String>) {
        observable.valueChanged = { [weak self] newText in
            self?.title = newText
        }
    }
}
