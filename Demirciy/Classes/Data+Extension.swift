//
//  Data+Extension.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

public extension Data {
    
    var bytes: [UInt8] {
        return [UInt8](self)
    }
    
    func toString() -> String? {
        return String(data: self, encoding: String.Encoding.utf8)
    }
    
    func toDictionary() -> [String: Any?]? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any?]
        } catch {
            DLogManager.e(error.localizedDescription)
            return nil
        }
    }
}
