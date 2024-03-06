//
//  DataBase.swift
//  NotesApp
//
//  Created by Victor Hugo Barajas Santibañez on 04/03/24.
//

import Foundation

class DataBase{

  func putTask(task : TaskModel){
    UserDefaults.standard.putData(object: task, key: DataBaseKeys.PUT.rawValue)
  }
  
  func getTask() -> [TaskModel]{
    if let tasks = UserDefaults.standard.getData(type: [TaskModel].self, key: DataBaseKeys.GET.rawValue){
      return tasks
    }
    return []
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
  //hhhhh
}
