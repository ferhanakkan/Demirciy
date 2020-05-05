//
//  DCollectionLayout.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public enum DCollectionLayoutAlignment {
    case left
    case none
}

open class DCollectionLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    public var alignment: DCollectionLayoutAlignment = DCollectionLayoutAlignment.none
    
    public init(scrollDirection: UICollectionView.ScrollDirection, sectionInset: UIEdgeInsets = UIEdgeInsets.zero, minimumLineSpacing: CGFloat = 0, minimumInteritemSpacing: CGFloat = 0) {
        super.init()
        
        self.scrollDirection = scrollDirection
        self.sectionInset = sectionInset
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing = minimumInteritemSpacing
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        switch alignment {
        case DCollectionLayoutAlignment.left:
            var leftMargin = sectionInset.left
            var maxY: CGFloat = -1.0
            attributes?.forEach { layoutAttribute in
                if layoutAttribute.frame.origin.y >= maxY {
                    leftMargin = sectionInset.left
                }

                layoutAttribute.frame.origin.x = leftMargin

                leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
                maxY = max(layoutAttribute.frame.maxY , maxY)
            }
        default:
            break
        }

        return attributes
    }
}

// MARK: - Public Functions
public extension DCollectionLayout {
    
    func initZero() -> DCollectionLayout {
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets.zero
        
        return self
    }
}
