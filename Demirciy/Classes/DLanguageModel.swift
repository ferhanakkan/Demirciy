//
//  DLanguageModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 1.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public struct DLanguageModel {
    
    // MARK: - Properties
    public var code: String
    public var longCode: String
    public var name: String
    
    public init(code: String, longCode: String, name: String) {
        self.code = code
        self.longCode = longCode
        self.name = name
    }
}

// MARK: - Public Functions
public extension DLanguageModel {
    
    static func english() -> DLanguageModel {
        let en = DLanguage.en
        return DLanguageModel(code: en.rawValue, longCode: en.getLongCode(), name: en.getName())
    }
    
    static func turkish() -> DLanguageModel {
        let tr = DLanguage.tr
        return DLanguageModel(code: tr.rawValue, longCode: tr.getLongCode(), name: tr.getName())
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

