//
//  DFResponseModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 17.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

public struct DFResponseModel<T: Decodable>: Decodable {
    
    public var isSuccess: Bool
    public var message: String
    public var error: DFErrorModel {
        return DFErrorModel(message)
    }
    public var rawData: Data?
    public var data: T?
    public var json: String? {
        guard let rawData = rawData else { return nil }
        return String(data: rawData, encoding: String.Encoding.utf8)
    }
    public var request: DFRequestModel?
    
    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        isSuccess = (try? keyedContainer.decode(Bool.self, forKey: .isSuccess)) ?? false
        message = (try? keyedContainer.decode(String.self, forKey: .message)) ?? ""
        data = try? keyedContainer.decode(T.self, forKey: .data)
    }
}

// MARK: Private Functions
private extension DFResponseModel {

    enum CodingKeys: String, CodingKey {
        case isSuccess
        case message
        case data
    }
}
