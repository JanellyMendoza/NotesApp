//
//  TaskModel.swift
//  NotesApp
//
//  Created by Victor Hugo Barajas Santibañez on 04/03/24.
//

import Foundation
import UIKit

class TaskModel : Codable{
  var nameUser : String?
  var nameTask : String?
  var Description : String?
  var color : UIColor?
  var status : Status?
  var dateCreate : String?
  var dateFinish : String?
  var priority : Priority?
  
  init(nameUser: String? = nil, nameTask: String? = nil, Description: String? = nil, color: UIColor? = nil, status: Status? = nil, dateCreate: String? = nil, dateFinish: String? = nil, priority: Priority? = nil) {
    self.nameUser = nameUser
    self.nameTask = nameTask
    self.Description = Description
    self.color = color
    self.status = status
    self.dateCreate = dateCreate
    self.dateFinish = dateFinish
    self.priority = priority
  }
  
  
  
}
