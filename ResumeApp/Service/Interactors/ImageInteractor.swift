//
//  GetImage.swift
//  ResumeApp
//
//  Created by Oliver Jordy Perez Escamilla on 6/18/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import Foundation

// MARK: ProfileInteractor
/// Abstracts the interaction with the service layer to download the image data
struct ImageInteractor: RequestImage {
    typealias ResponseType = Data
    private var path = String()
    var rawData: RequestData {
        return RequestData(path: path)
    }
    
    // MARK: - Initializers
    init(urlPath: String) {
        path = urlPath
    }
}
