//
//  UIImageViewExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 27/03/2019.
//  Copyright © 2019 Rashid Abbas. All rights reserved.
//

import UIKit
public extension UIImageView {
    func applyMask(maskImage: UIImage) {
        let maskView = UIImageView(image: maskImage)
        maskView.frame = self.bounds
        self.mask = maskView
    }
}
