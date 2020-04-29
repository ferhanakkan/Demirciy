//
//  DLanguageManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import RxSwift

public class DLanguageManager {
    
    // MARK: - Properties
    public static let shared: DLanguageManager = DLanguageManager()
    
    public var language: String = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? DLanguage.en.rawValue
    public var languageChanged: ((String) -> Void)?
}

// MARK: - Public Functions
public extension DLanguageManager {
    
    func changeLanguage(_ to: String) {
        language = to
        UserDefaults.standard.set([to], forKey: "AppleLanguages")
        languageChanged?(to)
    }
}

// MARK: - Public String Extensions
public extension String {
    
    func localized(bundle: Bundle? = nil) -> String {
        if let bundle = bundle {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        if let mainLanguagePath = Bundle.main.path(forResource: DLanguageManager.shared.language, ofType: "lproj"), let bundle = Bundle(path: mainLanguagePath), NSLocalizedString(self, bundle: bundle, comment: "") != self {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        if let baseLanguagePath = Bundle(for: DLanguageManager.self).path(forResource: DLanguageManager.shared.language, ofType: "lproj"), let bundle = Bundle(path: baseLanguagePath), NSLocalizedString(self, bundle: bundle, comment: "") != self {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        return self
    }
}
