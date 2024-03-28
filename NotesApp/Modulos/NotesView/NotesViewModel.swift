//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Janelly on 04/03/24.
//

import Foundation
import UIKit

class NotesViewModel{
    var coordinator: NotesCoordinator!
  
  func goToRegister()-> UIViewController{
    coordinator.goToRegister()
  }
    
    func goToSearch() -> UIViewController{
        coordinator.goToSearch()
    }
    
    func goToTask() -> UIViewController{
        coordinator.goToTask()
    }
}
    
