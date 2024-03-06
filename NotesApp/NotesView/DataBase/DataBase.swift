//
//  DataBase.swift
//  NotesApp
//
//  Created by Victor Hugo Barajas Santibañez on 04/03/24.
//

import Foundation

class DataBase{
var tasks = [TaskModel]()
    init(){
        updateLocalTasks()
    }
    func updateLocalTasks(){
        if let tasks = UserDefaults.standard.getData(type: [TaskModel].self, key: DataBaseKeys.GET.rawValue){
            self.tasks = tasks
        }
    }
    
  func putTask(task : TaskModel){
      tasks.append(task)
    UserDefaults.standard.putData(object: tasks, key: DataBaseKeys.PUT.rawValue)
      
  }
  
  func getTasks() -> [TaskModel]{
      return self.tasks
  }
    func deleteteTask(task: TaskModel){
        if let index = tasks.firstIndex(where: {$0.id == task.id}){
            tasks.remove(at: index)
            UserDefaults.standard.putData(object: tasks, key: DataBaseKeys.PUT.rawValue)
        }
    }
    func editTask(task: TaskModel){
        if let index = tasks.firstIndex(where: {$0.id == task.id}){
            tasks[index] = task
            UserDefaults.standard.putData(object: tasks, key: DataBaseKeys.PUT.rawValue)
        }
    }
}
extension UserDefaults{
  func putData<T:Encodable>(object : T, key : String){
    let jsonEoncoder = JSONEncoder()
    if let userEncode = try? jsonEoncoder.encode(object){
      self.set(userEncode, forKey: key)
    }
  }
  
  func getData<T : Decodable>(type : T.Type, key : String) -> T?{
    if let data = self.data(forKey: key){
      let jsonDecoder = JSONDecoder()
      if let user = try? jsonDecoder.decode(type, from: data){
        return user
      }else{
        print("Error decoding data")
        return nil
      }
    }else{
      print("Error getting data")
      return nil
    }
  }
  
}
