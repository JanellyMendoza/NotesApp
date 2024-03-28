//
//  TaskCoordinator.swift
//  NotesApp
//
//  Created by Angel Olvera on 27/03/24.
//

import Foundation
import UIKit

class TaskCoordinator : Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var navigationController : UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func startCoordinator() {
        let view = TaskViewController()
        let viewModel = TaskViewModel()
        
        view.viewModel = viewModel
        viewModel.coordinator = self
        
        navigationController.pushViewController(view, animated: true)
        
    }
    
    func startCoordinator() -> UIViewController{
        let view = TaskViewController()
        let viewModel = TaskViewModel()
        
        view.viewModel = viewModel
        viewModel.coordinator = self
        
        return view
        
    }
    
    
    
    
}
