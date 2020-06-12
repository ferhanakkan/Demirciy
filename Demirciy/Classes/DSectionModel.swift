//
//  DSectionModel.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 1.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public class DSectionModel: DModel {
    
    // MARK: - Properties
    public var title: String?
    public var rows: [DRowModel] = []
    
    public init(title: String? = nil, rows: [DRowModel] = []) {
        self.title = title
        self.rows = rows
    }
}
