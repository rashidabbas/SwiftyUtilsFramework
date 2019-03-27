//
//  UIViewExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit
public extension UIView {
    func addBackgroundImage(image: UIImage){
        let backgroundImage = UIImageView(frame: self.bounds)
        backgroundImage.image = image
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
    }
    
    func removeConstraints() {
        removeConstraints(constraints)
    }
    
    func deactivateAllConstraints() {
        NSLayoutConstraint.deactivate(getAllConstraints())
    }
    
    func getAllSubviews() -> [UIView] {
        return UIView.getAllSubviews(view: self)
    }
    
    func getAllConstraints() -> [NSLayoutConstraint] {
        
        var subviewsConstraints = getAllSubviews().flatMap { (view) -> [NSLayoutConstraint] in
            return view.constraints
        }
        
        if let superview = self.superview {
            subviewsConstraints += superview.constraints.compactMap{ (constraint) -> NSLayoutConstraint? in
                if let view = constraint.firstItem as? UIView {
                    if view == self {
                        return constraint
                    }
                }
                return nil
            }
        }
        
        return subviewsConstraints + constraints
    }
    
    class func getAllSubviews(view: UIView) -> [UIView] {
        return view.subviews.flatMap { subView -> [UIView] in
            return [subView] + getAllSubviews(view: subView)
        }
    }
    
    func findLabel(withText text: String) -> UILabel? {
        if let label = self as? UILabel, label.text == text {
            return label
        }
        
        for subview in self.subviews {
            if let found = subview.findLabel(withText: text) {
                return found
            }
        }
        
        return nil
    }
}

