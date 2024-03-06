//
//  TaskModel.swift
//  NotesApp
//
//  Created by Victor Hugo Barajas Santibañez on 04/03/24.
//

import Foundation
import UIKit

struct TaskModel : Codable {
    var nameUser : String?
    var nameTask : String?
    var Description : String?
    var color : String?
    var status : Status?
    var dateCreate : String?
    var dateFinish : String?
    var priority : Priority?
    var id : Int?
    
    
    }




  

