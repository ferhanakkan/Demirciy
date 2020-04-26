//
//  DFLanguageManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import RxSwift
import RxLocalizer

public class DFLanguageManager {
    
    // MARK: - Properties
    public static let shared: DFLanguageManager = DFLanguageManager()
}

// MARK: - Public Functions
public extension DFLanguageManager {
    
    func changeLanguage(_ to: String) {
        Localizer.shared.changeLanguage.accept(to)
    }
}

// MARK: - Public String Extensions
public extension String {
    
    func localized(bundle: Bundle? = nil) -> String {
        let localizerConfig = LocalizerConfig(defaults: UserDefaults.standard, bundle: Bundle(for: DFLanguageManager.self), tableName: "Localizable")
        Localizer.shared.changeConfiguration.accept(localizerConfig)

        return Localizer.shared.localized(self)
    }
}
