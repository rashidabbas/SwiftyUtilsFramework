//
//  UISliderX.swift
//  004 - Calculator (Tip)
//
//  Created by Mark Moeykens on 1/13/17.
//  Copyright © 2017 Mark Moeykens. All rights reserved.
//

import UIKit

@IBDesignable
open class UISliderX: UISlider {

    @IBInspectable public var thumbImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable public var thumbHighlightedImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    public func setupView() {
        setThumbImage(thumbImage, for: .normal)
        
        if let highlighted = thumbHighlightedImage {
            setThumbImage(highlighted, for: .highlighted)
        } else {
            setThumbImage(thumbImage, for: .highlighted)
        }
    }
}
