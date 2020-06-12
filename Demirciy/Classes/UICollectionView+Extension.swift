//
//  UICollectionView+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func register(headers: [UICollectionReusableView.Type]) {
        for header in headers {
            register(header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.identifier)
        }
    }
    
    func register(_ cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        }
    }
    
    func register(footers: [UICollectionReusableView.Type]) {
        for footer in footers {
            register(footer.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.identifier)
        }
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(forKind ofKind: String, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
