//
//  TitleTextField.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

open class TitleTextField: UITextField {
    
    fileprivate var titleLabel: UILabel!
    var titleHeight: CGFloat = 27
    
    var stringTag = ""
    var title: String = "" {
        didSet{
            titleLabel.text = title
        }
    }
    var titleFont: UIFont = UIFont.systemFont(ofSize: 16) {
        didSet{
            titleLabel.font = titleFont
        }
    }
    var titleColor: UIColor = .lightGray {
        didSet{
            titleLabel.textColor = titleColor
        }
    }
    
    var showDropDownArrow: Bool = false {
        didSet{
            if showDropDownArrow {
                let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                img.image = #imageLiteral(resourceName: "down_arrow")
                rightView = img
                rightViewMode = .always
            }
        }
    }
    
    var isTitleEnabled = true
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        borderStyle = .roundedRect
        if isTitleEnabled {
            titleLabel = UILabel(frame: .zero)
            addSubview(titleLabel)
        }
        
    }
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightViewRect = super.rightViewRect(forBounds: bounds)
        rightViewRect.origin.x -= 10;
        return rightViewRect
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        if isTitleEnabled && titleLabel.frame == .zero {
            titleLabel.font = titleFont
            titleLabel.textColor = titleColor
            titleLabel.frame = CGRect(x: 0, y: -titleHeight, width: bounds.size.width, height: titleHeight - 2)
        } else {
            titleHeight = 0
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

