//
//  RegisterTaskCoordinator.swift
//  NotesApp
//
//  Created by Janelly on 11/03/24.
//

import Foundation
import UIKit

class RegisterTaskCoordinator: Coordinator{
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = RegisterTaskViewController()
        let viewModel = RegisterTaskViewModel()
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)
    }
    
    func startCoordinator() -> UIViewController{
        let view = RegisterTaskViewController()
        let viewModel = RegisterTaskViewModel()
        viewModel.coordinator = self
        view.viewModel = viewModel
        return view
    }
}

