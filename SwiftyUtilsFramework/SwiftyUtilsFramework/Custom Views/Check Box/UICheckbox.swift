//
//  CheckBox.swift
//  ArtWork
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//


import UIKit

@IBDesignable open class UICheckbox: UIButton {
    
    /*
     * Variable describes UICheckbox padding
     */
    @IBInspectable open var padding: CGFloat = CGFloat(15)
    
    /*
     * Variable describes UICheckbox border width
     */
    @IBInspectable open var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    /*
     * Variable stores UICheckbox border color
     */
    @IBInspectable open var BorderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = BorderColor.cgColor
        }
    }
    
    /*
     * Variable stores UICheckbox border radius
     */
    @IBInspectable open var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    /*
     * Variable to store current UICheckbox select status
     */
    override open var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            onSelectStateChanged?(self, isSelected)
        }
    }
    
    /*
     * Callback for handling checkbox status change
     */
    open var onSelectStateChanged: ((_ checkbox: UICheckbox, _ selected: Bool) -> Void)?
    
    
    // MARK: Init
    
    /*
     * Create a new instance of a UICheckbox
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initDefaultParams()
    }
    
    /*
     * Create a new instance of a UICheckbox
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        initDefaultParams()
    }
    
    /*
     * Increase UICheckbox 'clickability' area for better UX
     */
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        let newBound = CGRect(
            x: self.bounds.origin.x - padding,
            y: self.bounds.origin.y - padding,
            width: self.bounds.width + 2 * padding,
            height: self.bounds.width + 2 * padding
        )
        
        return newBound.contains(point)
    }
    
    override open func prepareForInterfaceBuilder() {
        setTitle("", for: UIControl.State())
    }
    
}

// MARK: Private methods

public extension UICheckbox {
    
    fileprivate func initDefaultParams() {
        addTarget(self, action: #selector(UICheckbox.checkboxTapped), for: .touchUpInside)
        setTitle(nil, for: UIControl.State())
        
        clipsToBounds = true
        
        setCheckboxImage()
    }
    
    fileprivate func setCheckboxImage() {
//        let frameworkBundle = Bundle(for: UICheckbox.self)
//        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("UICheckbox.bundle")
//        let resourceBundle = Bundle(url: bundleURL!)
        let image = UIImage(named: "tick")//UIImage(named: "tick", in: resourceBundle, compatibleWith: nil)
        imageView?.contentMode = .scaleAspectFit
        
        setImage(nil, for: UIControl.State())
        setImage(image, for: .selected)
        setImage(image, for:  .highlighted)
        
    }
    
    @objc fileprivate func checkboxTapped(_ sender: UICheckbox) {
        isSelected = !isSelected
    }
}

