//
//  DFCollectionFlowLayout.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public enum DFCollectionFlowLayoutAlignment {
    case left
    case none
}

open class DFCollectionFlowLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    public var alignment: DFCollectionFlowLayoutAlignment = DFCollectionFlowLayoutAlignment.none
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        switch alignment {
        case DFCollectionFlowLayoutAlignment.left:
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
public extension DFCollectionFlowLayout {
    
    func initZero() -> DFCollectionFlowLayout {
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets.zero
        
        return self
    }
}
