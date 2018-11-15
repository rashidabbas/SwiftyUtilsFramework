//
//  NavigationControllerExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}

extension UINavigationController {
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func backToViewController(vc: AnyClass) {
        for element in viewControllers as Array {
            if element.isKind(of: vc) {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
}
