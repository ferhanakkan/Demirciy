//
//  DTable.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DTable: UITableView {
    
    public convenience init(style: UITableView.Style) {
        self.init(frame: .zero, style: style)
    }
}

// MARK: - Public Functions
public extension DTable {
    
    func hideSeparator() -> DTable {
        separatorStyle = .none
        return self
    }
}
