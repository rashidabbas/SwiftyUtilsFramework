//
//  AlertControllerExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit

public extension UIAlertController {
    convenience init(title: String?, customView: UIView, fallbackMessage: String?, preferredStyle: UIAlertController.Style) {
        
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


public func showAlert(title: String = "" , message: String = "" , onOkClick: @escaping (() -> ()) = {})  {
    DispatchQueue.main.async {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            onOkClick()
        }))
        UIApplication.topViewController?.present(alertController, animated: true, completion: nil)
    }
}

public func showConfirmationAlert(title: String = "" , message: String = "" , okTitle: String = "Submit" , cancelTitle: String = "Cancel", okClick: @escaping () -> () , cancelClick: @escaping () -> ())  {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: okTitle, style: .default, handler: { (action) in
        okClick()
        alertController.dismiss(animated: true, completion: nil)
    }))
    alertController.addAction(UIAlertAction(title: cancelTitle, style: .destructive, handler: { (action) in
        cancelClick()
    }))
    UIApplication.topViewController?.present(alertController, animated: true, completion: nil)
}

public func showAPIErrorAlert(title: String = "Error", message: String = "Something went wrong please try again." , okClick: @escaping () -> () , cancelClick: @escaping () -> ())  {
    showConfirmationAlert(title: title, message: message, okTitle: "Try Again", cancelTitle: "cancel", okClick: {
        okClick()
    }, cancelClick: {
        cancelClick()
    })
}
