//
//  DFUserDefaultsManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

public class DFUserDefaultsManager {
    
    // MARK: - Properties
    private var userDefaults: UserDefaults
    
    public init(suiteName: String? = nil) {
        if let suiteName = suiteName, let defaults = UserDefaults(suiteName: suiteName) {
            userDefaults = defaults
            return
        }
        
        userDefaults = UserDefaults.standard
    }
}

// MARK: - Public Functions
public extension DFUserDefaultsManager {
    
    func set(key: String, value: Any?) {
        userDefaults.set(value, forKey: key)
    }
    
    func get<T>(_ key: String) -> T? {
        return userDefaults.object(forKey: key) as? T
    }
    
    func isExist(_ key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
}
