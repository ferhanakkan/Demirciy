//
//  DErrorModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 22.03.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public class DErrorModel: Error {
    
    // MARK: - Properties
    public var messageKey: String?
    public var message: String {
        guard let messageKey = messageKey else { return DError.general.rawValue.dLocalized() }
        return isIgnoredError(messageKey) ? DError.general.rawValue.dLocalized() : messageKey.dLocalized()
    }
    public var customMessage: String?
    
    public init() {}
    
    public init(_ messageKey: String) {
        self.messageKey = messageKey
    }
    
    public init(customMessage: String? = nil) {
        self.customMessage = customMessage
    }
}

// MARK: - Public Functions
public extension DErrorModel {
    
    class func generalError() -> DErrorModel {
        return DErrorModel(DError.general.rawValue)
    }
    
    class func tryAgainError() -> DErrorModel {
        return DErrorModel(DError.tryAgain.rawValue)
    }
}

// MARK: - Private Functions
private extension DErrorModel {
    
    func isIgnoredError(_ messageKey: String) -> Bool {
        return messageKey == DError.parsing.rawValue
    }
}
