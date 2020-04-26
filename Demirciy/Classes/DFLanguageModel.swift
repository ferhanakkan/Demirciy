//
//  DFLanguageModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 1.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public class DFLanguageModel {
    
    // MARK: - Properties
    var code: String
    var longCode: String
    var name: String
    
    init(code: String) {
        self.code = code
        
        let language = DFLanguage(rawValue: code)!
        longCode = language.getLongCode()
        name = language.getName()
    }
}

public enum DFLanguage: String {
    case en = "en"
    case tr = "tr"
    
    public func getLongCode() -> String {
        switch self {
        case DFLanguage.en:
            return "en-US"
        case DFLanguage.tr:
            return "tr-TR"
        }
    }
    
    public func getName() -> String {
        switch self {
        case DFLanguage.en:
            return "English"
        case DFLanguage.tr:
            return "Türkçe"
        }
    }
}
