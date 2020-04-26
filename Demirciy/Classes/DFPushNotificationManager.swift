//
//  DFPushNotificationManager.swift
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

public class DFPushNotificationManager {
    
    // MARK: - Properties
    public var didReceiveRemoteNotification: ((_ userInfo: [AnyHashable: Any]) -> Void)?
    
    private init() {
        didReceiveRemoteNotification = { userInfo in
            DFLogManager.i("Came push notification: \(userInfo)")
            
            NotificationCenter.default.post(name: Notification.Name.didReceiveRemoteNotification, object: DFPushNotificationModel(userInfo))
        }
    }
}

// MARK: - Public Functions
public extension DFPushNotificationManager {
    
    class func register(completion: @escaping(_ isAllowed: Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [UNAuthorizationOptions.alert, UNAuthorizationOptions.badge, UNAuthorizationOptions.sound], completionHandler: { (isSuccess, error) in
            if let error = error {
                DFLogManager.e("Notification registration failed: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            completion(isSuccess)
        })
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
                DFLogManager.d(error.localizedDescription)
            }
        })
    }
}
