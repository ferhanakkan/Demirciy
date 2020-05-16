//
//  DScrollView.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DScrollView: UIScrollView {}

// MARK: - Public Functions
public extension DScrollView {
    
    func paging() -> DScrollView {
        isPagingEnabled = true
        return self
    }
}
