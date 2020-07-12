//
//  DTitleReusableHeaderView.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 28.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

open class DTitleReusableHeaderView: DCollectionReusableView {
    
    // MARK: - UI Properties
    public let titleLabel: DLabel = DLabel().font(.boldSystemFont(ofSize: 14))
    
    open override func addSubviews() {
        super.addSubviews()
        
        addSubviews([titleLabel])
    }
    
    open override func addConstraints() {
        super.addConstraints()
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalToSuperview().inset(24)
            maker.top.bottom.equalToSuperview()
        }
        
        layoutIfNeeded()
    }
}
