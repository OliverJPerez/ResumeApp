//
//  ViewModel.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/16/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: ProfileViewModel
final class ProfileViewModel: CustomTableViewColors {
    
    // MARK: - Interface properties
    var viewTitle = Observable("")
    var name = Observable("")
    var summary = Observable("")
    var isTableViewHidden = Observable(false)
    var isEmptyViewHidden = Observable(false)
    var profileImage = Observable(UIImage())
    var reloadTableViewClosure: (()->())?
    var tableViewBgColor = UIColor()
    var sendInfo: (Section, UIColor) -> Void = { _,_ in }
    var showAlert: ((String, String)->())?
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    // MARK: - Private properties
    private var profile: Profile?
    private var cellVMs = [SectionCellViewModel]()
    private var cellViewModels = [SectionCellViewModel]() {
        didSet {
            reloadTableViewClosure?()
        }
    }
    private var profileInteractor = ProfileInteractor()
    
    // MARK: - Initializers
    init() {
        setViewModelWithServiceResponse()
    }
    
    // MARK: - Interface methods
    /// Sets the view elements according to the service response
    func setViewModelWithServiceResponse() {
        profileInteractor.fetch(onSuccess: prepareView, onError: prepareAlert)
    }
    
    /// Prepares the information to be shown by the profile view controller
    ///
    /// - Parameters:
    ///   - profileInfo: The information of the profile
    func prepareView(with profileInfo: Profile) {
        viewTitle.value = NSLocalizedString(LocalizedKeys.profile.rawValue, comment: "The title of the profile view controller")
        profile = profileInfo
        name.value = profileInfo.name
        summary.value = profileInfo.summary
        isEmptyViewHidden.value = true
        isTableViewHidden.value = false
        
        // Tells the interactor to fetch the profile image with the image url and binds its response to the prepareProfileImage and prepareAlert methods
        ImageInteractor(urlPath: profileInfo.profilePicURL).download(onSuccess: prepareProfileImage,
                                                                     onError: prepareAlert)
        prepareSectionCellsViewModel(with: profileInfo)
    }
    
    /// Sends the information of the tapped cell
    ///
    /// - Parameters:
    ///   - index: The row of the tapped cell
    func SendTappedCellInfo(at index: Int) {
        guard let profile = profile else { return }
        let section = profile.sections[index]
        sendInfo(section, cellVMs[index].backgroundColor)
    }
    
    /// Returns the correspondant cell view model
    ///
    /// - Parameters:
    ///   - indexPath: The cell index path
    func getCellViewModel(at indexPath: IndexPath) -> SectionCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    // MARK: - Private methods
    /// Sets the view profile image
    ///
    /// - Parameters:
    ///   - data: The data to be converted to a UIImage instance
    private func prepareProfileImage(with data: Data) {
        self.profileImage.value = UIImage(data: data) ?? UIImage(named: "default-pic") ?? UIImage()
    }
    
    /// Prepares an alert when an error occurs
    ///
    /// - Parameters:
    ///   - error: The error
    private func prepareAlert(with error: Error) {
        let alertTitle = NSLocalizedString(LocalizedKeys.error.rawValue, comment: "Error title alert")
        let alertMessage = NSLocalizedString(LocalizedKeys.errorDescription.rawValue, comment: "Error alert message")
        isEmptyViewHidden.value = false
        isTableViewHidden.value = true
        showAlert?(alertTitle, alertMessage)
    }
    
    /// Prepares the section cells view configuration
    ///
    /// - Parameters:
    ///   - profileInfo: The information of the profile
    private func prepareSectionCellsViewModel(with profileInfo: Profile) {
        let selectedCellBg = UIView()
        selectedCellBg.backgroundColor = UIColor(named: "SelectedCell") ?? UIColor.gray
        
        for (index, section) in profileInfo.sections.enumerated() {
            let cellBgColor = getCellBackgroundColor(row: index, numberOfRows: profileInfo.sections.count)
            tableViewBgColor = updateTableViewColor(lastCellColor: cellBgColor)
            cellVMs.append(self.createCellViewModel(title: section.title, bgColor: cellBgColor, bgView: selectedCellBg) )
        }
        cellViewModels = cellVMs
    }
    
    /// Returns a new section cell view model instance
    ///
    /// - Parameters:
    ///   - title: The title of the cell
    ///   - bgColor: The background color of the cell
    ///   - bgView: The background view of the cell used to highlight the cell when selected
    private func createCellViewModel(title: String, bgColor: UIColor, bgView: UIView) -> SectionCellViewModel {
        return SectionCellViewModel(title: title, backgroundColor: bgColor, cellBackgroundView: bgView)
    }
}

