//
//  FlowCoordinator.swift
//  BindingsExample
//
//  Created by OliverPérez on 6/16/19.
//  Copyright © 2019 OliverPérez. All rights reserved.
//

import UIKit

// MARK: FlowCoordinator
class FlowCoordinator: FlowCoordinatorInterface {
    // MARK: - Properties
    var childCoordinators = [FlowCoordinator]()
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: FlowCoordinatorInterface methods
    func start() {
        showProfileView()
    }
    
    // MARK: - Flow coordinator logic
    /// Routes to the view according to the selected section
    ///
    /// - Parameters:
    ///   - section: The selected section
    ///   - bgColor: The background color of the destination view
    func routeToView(for section: Section, with bgColor: UIColor) {
        // The routing desition is taken according to the section data
        if let skills = section.skills {
            showSkillsDetail(title: section.title, skills: skills, bgColor: bgColor)
            return
        }
        if let workPlaces = section.workPlaces {
            showExperienceDetail(title: section.title, workPlaces: workPlaces, bgColor: bgColor)
            return
        }
        if let summary = section.summary{
            showDetail(title: section.title, summary: summary, bgColor: bgColor)
        }
    }
    
    // MARK: - Navigation methods
    /// Creates an instance of ProfileViewController from its storyboard and pushes it to the navigation controller
    func showProfileView() {
        let profileVC = ProfileViewController.instantiate(from: StoryboardNames.profile)
        let profileVM = ProfileViewModel()
        profileVC.viewModel = profileVM
        profileVM.sendInfo = { [weak self] section, bgColor in
            self?.routeToView(for: section, with: bgColor)
        }
        profileVM.showAlert = { [weak self] in
            self?.showAlert(title: $0, message: $1)
        }
        navigationController.pushViewController(profileVC, animated: false)
    }
    
    /// Creates an instance of DetailViewController from its storyboard and pushes it to the navigation controller
    func showDetail(title: String, summary: String, bgColor: UIColor) {
        let detailVC = DetailViewController.instantiate(from: StoryboardNames.detail)
        let detailVM = DetailViewModel()
        detailVC.viewModel = detailVM
        
        DispatchQueue.main.async{
            detailVM.title.value = title
            detailVM.summary.value = summary
            detailVM.bgColor.value = bgColor
        }
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    /// Creates an instance of SkillsDetailViewController from its storyboard and pushes it to the navigation controller
    func showSkillsDetail(title: String, skills: [Skill], bgColor: UIColor) {
        let skillsDetailVC = SkillsDetailViewController.instantiate(from: StoryboardNames.skills)
        let skillsDetailMV = SkillsDetailViewModel()
        skillsDetailVC.viewModel = skillsDetailMV
        
        DispatchQueue.main.async{
            skillsDetailMV.title.value = title
            skillsDetailMV.skills = skills
        }
        navigationController.pushViewController(skillsDetailVC, animated: true)
    }
    
    /// Creates an instance of ExperienceDetailViewController from its storyboard and pushes it to the navigation controller
    func showExperienceDetail(title: String, workPlaces: [WorkPlace], bgColor: UIColor) {
        let experienceDetailVC = ExperienceDetailViewController.instantiate(from: StoryboardNames.experience)
        let experienceDetailVM = ExperienceDetailViewModel()
        experienceDetailVC.viewModel = experienceDetailVM
        experienceDetailVM.sendInfo = { [weak self] title, summary in
            self?.showDetail(title: title, summary: summary, bgColor: bgColor)
        }
        DispatchQueue.main.async{
            experienceDetailVM.title.value = title
            experienceDetailVM.workPlaces = workPlaces
        }
        navigationController.pushViewController(experienceDetailVC, animated: true)
    }
    
    // MARK: - Alerts
    /// Presents an alert over the current view controller
    ///
    /// - Parameters:
    ///   - title: The title of the alert
    ///   - message: The message body of the alert
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionTitle = NSLocalizedString(LocalizedKeys.ok.rawValue, comment: "The action button title")
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default))
        navigationController.topViewController?.present(alertController, animated: true)
    }
}
