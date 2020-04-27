//
//  DFLanguageManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import RxSwift

public class DFLanguageManager {
    
    // MARK: - Properties
    public static let shared: DFLanguageManager = DFLanguageManager()
    
    public var language: String = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? DFLanguage.en.rawValue
    public var languageChanged: ((String) -> Void)?
}

// MARK: - Public Functions
public extension DFLanguageManager {
    
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
        
        if let mainLanguagePath = Bundle.main.path(forResource: DFLanguageManager.shared.language, ofType: "lproj"), let bundle = Bundle(path: mainLanguagePath), NSLocalizedString(self, bundle: bundle, comment: "") != self {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        if let baseLanguagePath = Bundle(for: DFLanguageManager.self).path(forResource: DFLanguageManager.shared.language, ofType: "lproj"), let bundle = Bundle(path: baseLanguagePath), NSLocalizedString(self, bundle: bundle, comment: "") != self {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        return self
    }
}
