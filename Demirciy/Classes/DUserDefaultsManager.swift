//
//  DUserDefaultsManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

public class DUserDefaultsManager: UserDefaults {
    
    // MARK: - Properties
    public static let demirciy: UserDefaults = UserDefaults(suiteName: Bundle(for: DUserDefaultsManager.self).bundleIdentifier)!
}

// MARK: - Public Functions
public extension DUserDefaultsManager {
    
    func set(key: String, value: Any?) {
        set(value, forKey: key)
    }
    
    func get<T>(_ key: String) -> T? {
        return object(forKey: key) as? T
    }
    
    func isExist(_ key: String) -> Bool {
        return object(forKey: key) != nil
    }
}
