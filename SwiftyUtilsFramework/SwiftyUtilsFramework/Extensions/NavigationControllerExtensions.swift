//
//  NavigationControllerExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    public func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}

public extension UINavigationController {
    public func backToViewController(vc: AnyClass) {
        for element in viewControllers as Array {
            if element.isKind(of: vc) {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
    @IBInspectable var barTintColor: UIColor? {
        set {
            navigationBar.barTintColor = newValue
        }
        get {
            guard  let color = navigationBar.barTintColor else { return nil }
            return color
        }
    }
    
    @IBInspectable var tintColor: UIColor? {
        set {
            navigationBar.tintColor = newValue
        }
        get {
            guard  let color = navigationBar.tintColor else { return nil }
            return color
        }
    }
    
    @IBInspectable var titleColor: UIColor? {
        set {
            guard let color = newValue else { return }
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        }
        get {
            return navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor
        }
    }
}
