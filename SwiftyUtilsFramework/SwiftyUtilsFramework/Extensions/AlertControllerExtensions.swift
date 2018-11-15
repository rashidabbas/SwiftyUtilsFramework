//
//  AlertControllerExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

public extension UIAlertController {
    public convenience init(title: String?, customView: UIView, fallbackMessage: String?, preferredStyle: UIAlertController.Style) {
        
        let marker = "__CUSTOM_CONTENT_MARKER__"
        self.init(title: title, message: marker, preferredStyle: preferredStyle)
        
        // Try to find the message label in the alert controller's view hierarchie
        if let customContentPlaceholder = self.view.findLabel(withText: marker),
            let customContainer =  customContentPlaceholder.superview {
            
            // The message label was found. Add the custom view over it and fix the autolayout...
            customContainer.addSubview(customView)
            
            customView.anchor(leading: customContainer.leadingAnchor, top: nil, trailing: customContainer.trailingAnchor, bottom: nil , padding: .init(top: 0, left: 8, bottom: 0, right: 8))
            
            customContentPlaceholder.anchor(leading: nil, top: customView.topAnchor, trailing: nil, bottom: nil , padding: .zero , size: .init(width: 0, height: 0))
            customContentPlaceholder.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1).isActive = true
            customContentPlaceholder.text = ""
        } else { // In case something fishy is going on, fall back to the standard behaviour and display a fallback message string
            self.message = fallbackMessage
        }
    }
}

