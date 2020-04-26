//
//  Array+Extension.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 23.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public extension Array {
    
    func contains<T>(_ obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
