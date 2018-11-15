//
//  DesignableUITextField.swift
//  SkyApp
//
//  Created by Mark Moeykens on 12/16/16.
//  Copyright © 2016 Mark Moeykens. All rights reserved.
//
//
import UIKit
@IBDesignable
open class UITextFieldX: UITextField {
    
    @IBInspectable public var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable public var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable public var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable public var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    private var _isRightViewVisible: Bool = true
    public var isRightViewVisible: Bool {
        get {
            return _isRightViewVisible
        }
        set {
            _isRightViewVisible = newValue
            updateView()
        }
    }
    
   public static let height: CGFloat = 40
    
    @IBInspectable public var placeHolderColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    public func updateView() {
        setLeftImage()
        setRightImage()
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
        
        
        tintColor = UIColor.white
        backgroundColor = UIColor.clear
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        cornerRadius = 5
        
    }
    
    public func setLeftImage() {
        leftViewMode = UITextField.ViewMode.always
        var view: UIView
        
        if let image = leftImage {
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + leftPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 20))
        }
        
        leftView = view
    }
    
    public func setRightImage() {
        rightViewMode = UITextField.ViewMode.always
        
        var view: UIView
        
        if let image = rightImage, isRightViewVisible {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + rightPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 20))
        }
        
        rightView = view
    }
    
    
    // MARK: - Corner Radius
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
