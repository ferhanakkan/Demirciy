//
//  DWeb.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 9.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit
import WebKit

open class DWeb: WKWebView {
    
    public override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        
        initUI()
        initLocale()
        initTheme()
        addSubviews()
        addConstraints()
        observe()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func initUI() {
        super.initUI()
        
        backgroundColor = .clear
    }
}
