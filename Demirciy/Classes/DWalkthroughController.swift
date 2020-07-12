//
//  DWalkthroughController.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 7.07.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DWalkthroughController: DController {
    
    // MARK: - UI Properties
    public lazy var collection: DCollection = {
        let collection = DCollection(layout: collectionLayout)
        collection.isPagingEnabled = true
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    public let collectionLayout: DCollectionLayout = {
        let layout: DCollectionLayout = DCollectionLayout(scrollDirection: UICollectionView.ScrollDirection.horizontal)
        layout.itemSize = UIScreen.main.bounds.size
        return layout
    }()
    public let pageControl = DPageControl()
    
    // MARK: - Properties
    public var isPageControlEnabled: Bool = true {
        didSet {
            pageControl.isHidden = !isPageControlEnabled
        }
    }
    
    open override func initUI() {
        super.initUI()
        
        collection.delegate = self
    }
    
    open override func addSubviews() {
        super.addSubviews()
        
        addSubviews([collection, pageControl])
    }
    
    open override func addConstraints() {
        super.addConstraints()
        
        collection.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().inset(DConstant.DUIConstant.defaultBottomOffset)
            maker.centerX.equalToSuperview()
        }
        
        view.layoutIfNeeded()
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

// MARK: - UICollectionViewDelegate
extension DWalkthroughController: UICollectionViewDelegate {}
