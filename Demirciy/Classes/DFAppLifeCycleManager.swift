//
//  DFAppLifeCycleManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

public class DFAppLifeCycleManager {
    
    // MARK: - Properties
    public static let shared: DFAppLifeCycleManager = DFAppLifeCycleManager()
    
    // AppDelegate
    public var applicationDidBecomeActive: (() -> Void)?
    public var applicationWillResignActive: (() -> Void)?
    public var applicationWillEnterForeground: (() -> Void)?
    public var applicationDidEnterBackground: (() -> Void)?
    
    // SceneDelegate
    public var sceneDidDisconnect: (() -> Void)?
    public var sceneDidBecomeActive: (() -> Void)?
    public var sceneWillResignActive: (() -> Void)?
    public var sceneWillEnterForeground: (() -> Void)?
    public var sceneDidEnterBackground: (() -> Void)?
}
