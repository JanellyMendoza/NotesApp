//
//  NotesCoordinator.swift
//  NotesApp
//
//  Created by Janelly on 04/03/24.
//

import Foundation
import UIKit

class NotesCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = NotesViewController()
        let viewModel = NotesViewModel()
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.setViewControllers([view], animated: true)
    }
    
    
}
