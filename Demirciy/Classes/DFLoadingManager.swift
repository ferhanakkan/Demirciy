//
//  DFLoadingManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 28.01.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DFLoadingManager {
    
    // MARK: - Properties
    public static let shared: DFLoadingManager = DFLoadingManager()
    
    private let controller: DFLoadingController = DFLoadingController()
    private var isShowing: Bool = false
    private var lastShowedDate: Date = Date()
    private let minShowingSeconds: Int = 1
    private var elapsedSecondsSinceLastShowed: Int {
        return lastShowedDate.totalDistance(from: Date(), resultIn: Calendar.Component.second) ?? 0
    }
    
    private init() {
        controller.view.alpha = 0
    }
}

// MARK: - Public Functions
public extension DFLoadingManager {
    
    func show() {
        if isShowing { return }
        isShowing = true
        lastShowedDate = Date()
        
        controller.indicator.startAnimating()
        UIApplication.shared.keyWindow?.addSubview(controller.view)
        
        UIView.animate(withDuration: DFConstant.DFUIConstant.animationDurationFast) {
            self.controller.view.alpha = 1
        }
    }
    
    func hide() {
        guard elapsedSecondsSinceLastShowed < minShowingSeconds else {
            remove()
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(minShowingSeconds - elapsedSecondsSinceLastShowed - 1)) {
            self.remove()
        }
    }
}

// MARK: - Private Functions
private extension DFLoadingManager {
    
    func remove() {
        UIView.animate(withDuration: DFConstant.DFUIConstant.animationDurationFast, animations: {
            self.controller.view.alpha = 0
        }, completion: { (_) in
            self.controller.indicator.stopAnimating()
            self.controller.view.removeFromSuperview()
            self.isShowing = false
        })
    }
}
