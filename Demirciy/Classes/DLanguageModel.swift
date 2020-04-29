//
//  DLanguageModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 1.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public class DLanguageModel: DModel {
    
    // MARK: - Properties
    public var code: String
    public var longCode: String
    public var name: String
    
    public init(code: String) {
        self.code = code
        
        let language = DLanguage(rawValue: code)!
        longCode = language.getLongCode()
        name = language.getName()
    }
}

public enum DLanguage: String {
    case en = "en"
    case tr = "tr"
    
    public func getLongCode() -> String {
        switch self {
        case DLanguage.en:
            return "en-US"
        case DLanguage.tr:
            return "tr-TR"
        }
    }
    
    public func getName() -> String {
        switch self {
        case DLanguage.en:
            return "English"
        case DLanguage.tr:
            return "Türkçe"
        }
    }
}
