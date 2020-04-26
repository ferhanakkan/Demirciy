//
//  CustomStringConvertible+Extension.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 2.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public extension CustomStringConvertible {
    
    var description: String {
        let mirror = Mirror(reflecting: self)
        var descArray: [String] = []
        
        for child in mirror.children {
            if let label = child.label {
                descArray.append("\(label): \(child.value)")
            }
        }
        
        return "\(type(of: self))\n[\(descArray.joined(separator: ", "))]"
    }
}
