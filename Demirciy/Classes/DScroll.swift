//
//  DScroll.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DScroll: UIScrollView {}

// MARK: - Public Functions
public extension DScroll {
    
    func paging() -> DScroll {
        isPagingEnabled = true
        return self
    }
    
    func indicators(isVerticalEnabled: Bool = true, isHorizontalEnabled: Bool = true) -> DScroll {
        showsVerticalScrollIndicator = isVerticalEnabled
        showsHorizontalScrollIndicator = isHorizontalEnabled
        return self
    }
}
