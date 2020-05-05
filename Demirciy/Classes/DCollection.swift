//
//  DCollection.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DCollection: UICollectionView {
    
    public init(layout: DCollectionLayout = DCollectionLayout(scrollDirection: UICollectionView.ScrollDirection.vertical)) {
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
