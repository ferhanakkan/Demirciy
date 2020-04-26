//
//  DFLocationManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit
import CoreLocation

public class DFLocationManager {
    
    // MARK: - Properties
    public static let shared: DFLocationManager = DFLocationManager()
}

// MARK: - Public Functions
public extension DFLocationManager {
    
    func locationDeniedErrorAlert(controller: UIViewController?, cancelCompletion: @escaping() -> Void = {}) {
        DFAlertManager.showConfirm(title: "General_locationPermissionDeniedAlertTitle".localized(), message: "DFGeneral_locationPermissionDeniedAlertMessage".localized(), confirmButtonTitle: "DFGeneral_locationPermissionDeniedAlertGoSettings".localized(), controller: controller, confirmAction: {
            DFAppManager.shared.showAppSettings()
        }) {
            cancelCompletion()
        }
    }
    
    func isLocationEnabled() -> Bool {
        return
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways ||
                CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse
    }
}
