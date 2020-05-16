//
//  DSegmentedControl.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 11.05.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DSegmentedControl: UISegmentedControl {
    
    // MARK: - Properties
    public var indexDidChange: ((_ index: Int) -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    public override init(items: [Any]?) {
        super.init(items: items)
        
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Functions
private extension DSegmentedControl {
    
    func commonInit() {
        addTarget(self, action: #selector(valueChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc func valueChanged() {
        indexDidChange?(selectedSegmentIndex)
    }
}
