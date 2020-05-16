//
//  UICollectionView+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func register(_ cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
