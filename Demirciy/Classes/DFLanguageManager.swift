//
//  DFLanguageManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

//import RxLocalizer

public class DFLanguageManager {
    
    // MARK: - Properties
    public static let shared: DFLanguageManager = DFLanguageManager()
    
//    // Set if to force language selection
//    public var languageCode: String?
}

// MARK: - Public Functions
public extension DFLanguageManager {
    
    func changeLanguage(_ to: String) {
//        Localizer.shared.changeLanguage.accept("en")
    }
}

// MARK: - Public String Extensions
public extension String {
    
    func localized(bundle: Bundle? = nil) -> String {
//        let localizerConfig = LocalizerConfig(defaults: UserDefaults.standard, bundle: bundle ?? Bundle.main, tableName: "Localizable")
//        Localizer.shared.changeConfiguration.accept(localizerConfig)
//
//        return Localizer.shared.localized(self)
        
        return ""
        
//        if let bundle = bundle {
//            return NSLocalizedString(self, bundle: bundle, comment: "")
//        }
//
//        if let languageCode = DFLanguageManager.shared.languageCode {
//            if let selectedLanguagePath = Bundle.main.path(forResource: languageCode, ofType: "lproj"), let selectedBundle = Bundle(path: selectedLanguagePath), NSLocalizedString(self, bundle: selectedBundle, comment: "") != self {
//                return NSLocalizedString(self, bundle: selectedBundle, comment: "")
//            } else if let selectedLanguagePath = Bundle(for: DFLanguageManager.self).path(forResource: languageCode, ofType: "lproj"), let selectedBundle = Bundle(path: selectedLanguagePath), NSLocalizedString(self, bundle: selectedBundle, comment: "") != self {
//                return NSLocalizedString(self, bundle: selectedBundle, comment: "")
//            }
//        }
//
//        var localizedString: String = self
//
//        let localizedInBaseString: String = NSLocalizedString(self, bundle: Bundle(for: DFLanguageManager.self), comment: "")
//        if localizedInBaseString != self {
//            localizedString = localizedInBaseString
//        }
//
//        let localizedInMainString: String = NSLocalizedString(self, bundle: Bundle.main, comment: "")
//        if localizedInMainString != self {
//            localizedString = localizedInMainString
//        }
//
//        return localizedString
    }
}
