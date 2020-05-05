//
//  DLocationManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit
import CoreLocation

public class DLocationManager {
    
    // MARK: - Properties
    public static let shared: DLocationManager = DLocationManager()
}

// MARK: - Public Functions
public extension DLocationManager {
    
    func locationDeniedErrorAlert(controller: UIViewController?, cancelCompletion: @escaping() -> Void = {}) {
        DAlertManager.showConfirm(title: "DGeneral_locationPermissionDeniedAlertTitle".dLocalized(), message: "DGeneral_locationPermissionDeniedAlertMessage".dLocalized(), confirmButtonTitle: "DGeneral_locationPermissionDeniedAlertGoSettings".dLocalized(), controller: controller, confirmAction: {
            DAppManager.shared.showAppSettings()
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
