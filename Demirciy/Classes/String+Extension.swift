//
//  String+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 23.05.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public extension String {
    
    subscript (i: Int) -> Character {
        return Array(self)[i]
    }

    subscript (r: CountableClosedRange<Int>) -> String {
        return String(Array(self)[r])
    }

    subscript (r: CountableRange<Int>) -> String {
        return self[r.lowerBound...r.upperBound-1]
    }
}
