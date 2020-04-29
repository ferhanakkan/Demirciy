//
//  DCollection.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DCollection: UICollectionView {}

// MARK: - Public Functions
public extension DCollection {
    
    convenience init() {
        self.init(frame: CGRect.zero, collectionViewLayout: DCollectionFlowLayout())
        
        backgroundColor = UIColor.clear
        keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag
    }
}
