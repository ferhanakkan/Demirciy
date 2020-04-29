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
        guard let messageKey = messageKey else { return DError.general.rawValue.localized() }
        return isIgnoredError(messageKey) ? DError.general.rawValue.localized() : messageKey.localized()
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
        let errorModel: DErrorModel = DErrorModel()
        errorModel.messageKey = DError.general.rawValue
        return errorModel
    }
    
    class func tryAgainError() -> DErrorModel {
        let errorModel: DErrorModel = DErrorModel()
        errorModel.messageKey = DError.tryAgain.rawValue
        return errorModel
    }
}

// MARK: - Private Functions
private extension DErrorModel {
    
    func isIgnoredError(_ messageKey: String) -> Bool {
        return false
    }
}
