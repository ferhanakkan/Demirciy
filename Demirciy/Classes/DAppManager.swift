//
//  DAppManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 22.03.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DAppManager {
    
    // MARK: - Properties
    public static let shared: DAppManager = DAppManager()
    
    var keyWindow: UIWindow? {
//        return UIApplication.shared.connectedScenes
//            .filter({ $0.activationState == UIScene.ActivationState.foregroundActive })
//            .map({ $0 as? UIWindowScene })
//            .compactMap({ $0 })
//            .first?.windows.filter({ $0.isKeyWindow }).first
        return UIApplication.shared.keyWindow
    }
    
    private init() {
        // Hides auto-layout error logs
//        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
}

// MARK: - Public Functions
public extension DAppManager {
    
    func showAppSettings() {
        guard let appSettingsURL = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettingsURL) else { return }
        UIApplication.shared.open(appSettingsURL)
    }
}
