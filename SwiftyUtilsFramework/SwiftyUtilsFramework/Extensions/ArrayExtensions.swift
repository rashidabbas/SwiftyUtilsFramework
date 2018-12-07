//
//  ArrayExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 07/12/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit
extension Array where Element == UIView {
    func stack(axis: NSLayoutConstraint.Axis = .horizontal , spacing: CGFloat = 0 , distribution: UIStackView.Distribution = .fillProportionally) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: self)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        return stackView
    }
}
