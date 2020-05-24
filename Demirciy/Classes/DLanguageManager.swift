//
//  DLanguageManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import RxSwift
import RxLocalizer

public class DLanguageManager {
    
    // MARK: - Properties
    public static let shared: DLanguageManager = DLanguageManager()
    
    var language: String {
        return Localizer.shared.currentLanguageCodeValue ?? UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? DLanguage.en.rawValue
    }
}

// MARK: - Public String Extensions
public extension String {
    
    func dLocalized() -> String {
        if let mainLanguagePath = Bundle.main.path(forResource: DLanguageManager.shared.language, ofType: "lproj"), let bundle = Bundle(path: mainLanguagePath), NSLocalizedString(self, bundle: bundle, comment: "") != self {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }

        if let baseLanguagePath = Bundle(for: DLanguageManager.self).path(forResource: DLanguageManager.shared.language, ofType: "lproj"), let bundle = Bundle(path: baseLanguagePath), NSLocalizedString(self, bundle: bundle, comment: "") != self {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        return self
    }
}
