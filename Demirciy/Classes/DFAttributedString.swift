//
//  DFAttributedString.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public class DFAttributedString {
    
    // MARK: - Properties
    private var string: String = ""
    private var range: NSRange {
        return (string as NSString).range(of: string)
    }
    private var attributes: [[NSAttributedString.Key: Any]] = [[:]]
    private var paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
    public var attributedString: NSMutableAttributedString?
    public var font: UIFont {
        didSet {
            addAttribute([NSAttributedString.Key.font: font])
        }
    }
    public var color: UIColor {
        didSet {
            addAttribute([NSAttributedString.Key.foregroundColor: color])
        }
    }
    public var alignment: NSTextAlignment = NSTextAlignment.natural {
        didSet {
            paragraphStyle.alignment = alignment
            addAttribute([NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    public var lineSpacing: CGFloat {
        didSet {
            paragraphStyle.lineSpacing = lineSpacing
            addAttribute([NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    public init(string: String) {
        self.string = string
        
        attributedString = NSMutableAttributedString(string: string)
        font = UIFont.medium()
        color = UIColor.black
        lineSpacing = 0
    }
}

// MARK: - Public Functions
public extension DFAttributedString {
    
    func insert(_ willInsertAttributedString: DFAttributedString) {
        let insertRange: NSRange = (string as NSString).range(of: willInsertAttributedString.string)
        
        for attribute in willInsertAttributedString.attributes {
            attributedString?.addAttributes(attribute, range: insertRange)
        }
    }
}

// MARK: - Private Functions
private extension DFAttributedString {
    
    func addAttribute(_ attribute: [NSAttributedString.Key: Any]) {
        attributedString?.addAttributes(attribute, range: range)
        attributes.append(attribute)
    }
}
