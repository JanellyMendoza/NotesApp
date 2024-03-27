//
//  LocalNotificationManager.swift
//  NotesApp
//
//  Created by Angel Duarte on 26/03/24.
//

import Foundation
import UserNotifications

class LocalNotificationManager{
  
  static let shared = LocalNotificationManager() // Singleton instance
  
  private init() {} // Private initializer to enforce singleton
  
  
  func scheduleNotification(title: String, body: String, timeInterval: TimeInterval, identifier: String) {
    print("Notificacion creada!")
          let content = UNMutableNotificationContent()
          content.title = title
          content.body = body
          content.sound = UNNotificationSound.default
          let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
          let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
          UNUserNotificationCenter.current().add(request) { (error) in
              if let error = error {
                  print("Error al programar la notificación: \(error.localizedDescription)")
              } else {
                  print("Notificación programada exitosamente")
              }
          }
      }
}
