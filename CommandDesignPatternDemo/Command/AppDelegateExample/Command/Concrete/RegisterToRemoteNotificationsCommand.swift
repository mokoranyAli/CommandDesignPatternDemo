//
//  RegisterToRemoteNotificationsCommand.swift
//  CommandDesignPatternDemo
//
//  Created by Mohamed Korany on 6/16/21.
//  Copyright © 2021 Mohamed Korany. All rights reserved.
//

import Foundation
import UserNotifications

// MARK: - RegisterToRemoteNotificationsCommand
//
/// This is for setup register for remote notifications
///
class RegisterToRemoteNotificationsCommand: NSObject, Command {
    
    // MARK: - Handlers
    
    func execute() {
        requestRemoteNotifications()
    }
}

// MARK: - Private Handlers
//
private extension RegisterToRemoteNotificationsCommand {
  
  /// Setup: Remote notification
  ///
  func requestRemoteNotifications() {
    print(" Register for remote notifications ")
     let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.delegate = self
  }
}

/// UNUserNotificationCenterDelegate
///
extension RegisterToRemoteNotificationsCommand: UNUserNotificationCenterDelegate {
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.alert, .sound, .badge])
  }
}
