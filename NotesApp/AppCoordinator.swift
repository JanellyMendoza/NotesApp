//
//  AppCoordinator.swift
//  NotesApp
//
//  Created by Janelly on 04/03/24.
//

import Foundation
import UIKit
protocol Coordinator{
    var childCoordinator: [Coordinator]{
        get set
    }
    func startCoordinator()
    
}
class AppCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var window: UIWindow
    init( window: UIWindow) {
        self.window = window
    }
    func startCoordinator() {
        let navigationController  = UINavigationController()
        let startNotesAppCoordinator = NotesCoordinator(navigationController: navigationController)
        startNotesAppCoordinator.startCoordinator()
        childCoordinator.append(startNotesAppCoordinator)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
}















