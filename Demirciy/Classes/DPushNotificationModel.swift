//
//  DPushNotificationModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

public class DPushNotificationModel: DModel {
    
    // MARK: - Properties
    public var alert: String?
    public var sound: String?
    public var isHasPopup: Bool?
    
    public init(_ userInfo: [AnyHashable: Any]) {
        if let customJSON = userInfo["custom"] as? [String: Any] {
            if let aJSON = customJSON["a"] as? [String: Any] {
                isHasPopup = aJSON["hasPopup"] as? Bool
            }
        }
        if let apsJSON = userInfo["aps"] as? [String: Any] {
            alert = apsJSON["alert"] as? String
            sound = apsJSON["sound"] as? String
        }
    }
    
//    public init(aps userInfo: [AnyHashable: Any]) {
//        guard let apsJSON = userInfo["aps"] as? [String: Any] else { return }
//        sound = apsJSON["sound"] as? String
//        badge = apsJSON["badge"] as? Int
//        if let dataJSON = apsJSON["data"] as? [String: Any] {
//            isHasPopup = dataJSON["hasPopup"] as? Bool
//        }
//    }
//
//    public init(custom userInfo: [AnyHashable: Any]) {
//        guard let apsJSON = userInfo["aps"] as? [String: Any] else { return }
//        sound = apsJSON["sound"] as? String
//        badge = apsJSON["badge"] as? Int
//        if let dataJSON = apsJSON["data"] as? [String: Any] {
//            isHasPopup = dataJSON["hasPopup"] as? Bool
//        }
//    }
}
