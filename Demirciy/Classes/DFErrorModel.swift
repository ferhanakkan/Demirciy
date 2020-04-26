//
//  DFErrorModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 22.03.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public class DFErrorModel: Error {
    
    // MARK: - Properties
    public var messageKey: String?
    public var message: String {
        guard let messageKey = messageKey else { return DFError.general.rawValue.localized() }
        return isIgnoredError(messageKey) ? DFError.general.rawValue.localized() : messageKey.localized()
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
public extension DFErrorModel {
    
    class func generalError() -> DFErrorModel {
        let errorModel: DFErrorModel = DFErrorModel()
        errorModel.messageKey = DFError.general.rawValue
        return errorModel
    }
    
    class func tryAgainError() -> DFErrorModel {
        let errorModel: DFErrorModel = DFErrorModel()
        errorModel.messageKey = DFError.tryAgain.rawValue
        return errorModel
    }
}

// MARK: - Private Functions
private extension DFErrorModel {
    
    func isIgnoredError(_ messageKey: String) -> Bool {
        return false
    }
}
