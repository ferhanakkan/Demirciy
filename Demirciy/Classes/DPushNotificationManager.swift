//
//  DPushNotificationManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit
import UserNotifications

public extension NSNotification.Name {
    static let didReceiveRemoteNotification = Notification.Name(rawValue: "DemirciyFramework.didReceiveRemoteNotification")
}

public class DPushNotificationManager {
    
    // MARK: - Properties
    public var didReceiveRemoteNotification: ((_ userInfo: [AnyHashable: Any]) -> Void)?
    
    private init() {
        didReceiveRemoteNotification = { userInfo in
            DLogManager.i("Came push notification: \(userInfo)")
            
            NotificationCenter.default.post(name: Notification.Name.didReceiveRemoteNotification, object: DPushNotificationModel(userInfo))
        }
    }
}

// MARK: - Public Functions
public extension DPushNotificationManager {
    
    class func register(completion: @escaping(_ isAllowed: Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [UNAuthorizationOptions.alert, UNAuthorizationOptions.badge, UNAuthorizationOptions.sound], completionHandler: { (isSuccess, error) in
            if let error = error {
                DLogManager.e("Notification registration failed: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(isSuccess)
            }
        })
    }
    
    class func authStatus(completion: @escaping(_ status: UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings() { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    class func sendLocalNotification(title: String = "Test title", body: String = "Test body", userInfo: [AnyHashable: Any] = [:]) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.userInfo = userInfo
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: "UYLLocalNotification",
                                            content: content, trigger: UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false))
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                DLogManager.d(error.localizedDescription)
            }
        })
    }
}
