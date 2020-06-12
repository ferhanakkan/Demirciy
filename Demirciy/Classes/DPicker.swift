//
//  DPicker.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 31.05.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

open class DPicker: UIPickerView {
    
    // MARK: - Properties
    public var items: [[String]] = [] {
        didSet {
            reloadAllComponents()
        }
    }
    public var textColor: UIColor? {
        didSet {
            guard let textColor = textColor else { return }
            setValue(textColor, forKeyPath: "textColor")
        }
    }
    public var didSelectRow: ((_ component: Int, _ row: Int) -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        dataSource = self
        delegate = self
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UIPickerViewDataSource
extension DPicker: UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return items.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items[component].count
    }
}

// MARK: - UIPickerViewDelegate
extension DPicker: UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[component][row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didSelectRow?(component, row)
    }
}
