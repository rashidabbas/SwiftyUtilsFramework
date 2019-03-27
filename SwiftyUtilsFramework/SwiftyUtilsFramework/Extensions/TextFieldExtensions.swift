//
//  TextFieldExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit
public extension UITextField {
    func rightViewWithImage(image: UIImage)  {
        rightView?.removeFromSuperview()
        rightViewMode = .always
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        img.image = image.withRenderingMode(.alwaysOriginal)
        img.isUserInteractionEnabled = true
        rightView = img
    }
    
    func leftImage(image: UIImage) {
        leftViewMode = .always
        let lv = UIImageView()
        lv.image = image
        leftView = lv
    }
    func moveToNextField()  {
        let tag = self.tag + 1
        if let nextTextField = superview?.viewWithTag(tag) as? UITextField {
            nextTextField.becomeFirstResponder()
            return
        }
        self.resignFirstResponder()
    }
    
    func moveToNextFieldInTableViewCell()  {
        let tag = self.tag + 1
        if let nextTextField = superview?.superview?.viewWithTag(tag) as? UITextField {
            nextTextField.becomeFirstResponder()
            return
        }
        self.resignFirstResponder()
    }
}
