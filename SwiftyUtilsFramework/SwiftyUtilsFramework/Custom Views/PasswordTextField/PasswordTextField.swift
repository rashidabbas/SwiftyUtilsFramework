//
//  PasswordTextField.swift
//  PasswordTextField
//
//  Created by Chris Jimenez on 2/9/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit
//  A custom TextField with a switchable icon which shows or hides the password
open class PasswordTextField: UITextField {
    
    @IBInspectable public var leftPadding: CGFloat = 0 {
        didSet {
            setLeftImage()
        }
    }
    @IBInspectable public var leftImage: UIImage? {
        didSet {
            setLeftImage()
        }
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
    
    
    
    //KVO Context
    fileprivate var kvoContext: UInt8 = 0
    
    /// Enums with the values of when to show the secure or insecure text button
    public enum ShowButtonWhile: String {
        case Editing = "editing"
        case Always = "always"
        case Never = "never"
        
        var textViewMode: UITextField.ViewMode {
            switch self{
                
            case .Editing:
                return .whileEditing
            
            case .Always:
                return .always
                
            case .Never:
                return .never
                
            }
        }
    }

    
    /**
     Default initializer for the textfield
     
     - parameter frame: fra me of the view
     
     - returns:
     */
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    /**
     Default initializer for the textfield done from storyboard
     
     - parameter coder: coder
     
     - returns:
     */
    public required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setup()
        
    }
    
    /// When to show the button defaults to only when editing
    open var showButtonWhile = ShowButtonWhile.Editing{
        
        didSet{
             self.rightViewMode = self.showButtonWhile.textViewMode
        }
            
    }
    
    /// The rule to apply to the validation password rule
//    open var validationRule:RegexRule = PasswordRule()
    
    
    /**
     *  Shows the toggle button while editing, never, or always. The possible values to set are "editing", "never", "always
     */
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'showButtonWhile' instead.")
    @IBInspectable var showToggleButtonWhile: String? {
        willSet {
            if let newShow = ShowButtonWhile(rawValue: newValue?.lowercased() ?? "") {
                self.showButtonWhile = newShow
            }
        }
    }
    
    /// Convenience var to change teh border width
    @IBInspectable  dynamic open var borderWidth: CGFloat = 0 { didSet { self.layer.borderWidth = borderWidth } }
    /// Convenience var to change the corner radius
//    @IBInspectable dynamic open var cornerRadius: CGFloat = 0 { didSet { self.layer.cornerRadius = cornerRadius } }
    
    /**
     The color of the image.
     
     This property applies a color to the image. The default value for this property is gray.
     */
    @IBInspectable open var imageTintColor: UIColor = UIColor.gray {
        didSet {
            
            self.secureTextButton.tintColor = imageTintColor
        }
    }
    
    
    /**
     The image to show the secure text
     */
    @IBInspectable open var customShowSecureTextImage: UIImage? {
        
        didSet{
            
            if let image = customShowSecureTextImage
            {
                self.secureTextButton.showSecureTextImage = image
            }
        }
    }
    
    
    /**
     The image to hide the secure text
     */
    @IBInspectable open var customHideSecureTextImage: UIImage? {
        
        didSet{
            
            if let image = customHideSecureTextImage
            {
                self.secureTextButton.hideSecureTextImage = image
            }
            
        }
    }
    
    /**
     Initialize properties and values
     */
    func setup()
    {
        self.isSecureTextEntry = true
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        // Note from Camilo -> Removing so it can be set from XIB
        //self.keyboardType = .asciiCapable
        self.rightViewMode = self.showButtonWhile.textViewMode
        self.rightView = self.secureTextButton
        
        self.secureTextButton.addObserver(self, forKeyPath: "isSecure", options: NSKeyValueObservingOptions.new, context: &kvoContext)
    }
    
    
    /// retuns if the textfield is secure or not
    open var isSecure: Bool{
        get{
            return isSecureTextEntry
        }
    }
    
    open lazy var secureTextButton: SecureTextToggleButton = {
        
        return SecureTextToggleButton(imageTint: self.imageTintColor)
        
    }()
    
    /**
     Toggle the secure text view or not
     */
    open func setSecureMode(_ secure:Bool)
    {

        // Note by Camilo: it cause weird animation.
        //self.resignFirstResponder()
        self.isSecureTextEntry = secure
        
        /// Kind of ugly hack to make the text refresh after the toggle. The size of the secure fonts are different than the normal ones and it shows trailing white space
        let tempText = self.text;
        self.text = " ";
        self.text = tempText;

        // Note by Camilo: it cause weird animation.
        //self.becomeFirstResponder()
        
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &kvoContext {
            
            if context == &kvoContext {
                
                self.setSecureMode(self.secureTextButton.isSecure)
                
                
            } else {
                super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            }
        }
    }
    
    deinit {
        self.secureTextButton.removeObserver(self, forKeyPath: "isSecure")
    }
    
    
}
