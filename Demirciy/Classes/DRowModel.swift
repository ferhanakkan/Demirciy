//
//  DRowModel.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 1.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public class DRowModel: DModel {
    
    // MARK: - Properties
    public var data: Any?
    
    public override init() {
        super.init()
    }
    
    public init(data: Any) {
        super.init()
        
        self.data = data
    }
}
