//
//  GradientLabel.swift
//  kontrol
//
//  Created by Rashid Abbas on 10/09/2018.
//  Copyright © 2018 kontrol. All rights reserved.
////
//
import UIKit
open class GradientLabel: UILabel {

    // MARK: - Colors to create gradient from
    @IBInspectable
    public var gradientFrom: UIColor? {
        didSet {
            updateGradientTextColor()
        }
    }
    @IBInspectable
    public var gradientTo: UIColor? {
        didSet {
            updateGradientTextColor()
        }
    }

    private func updateGradientTextColor() {
        guard
            let c1 = gradientFrom,
            let c2 = gradientTo else { return }

        // Create size of intrinsic size for the label with current text.
        // Otherwise the gradient textColor will repeat when text is changed.
        let size = CGSize(width: intrinsicContentSize.width, height: 1)

        // Begin image context
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        // Always remember to close the image context when leaving
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return }
//
//        // Create the gradient
        let colors = [c1.cgColor, c2.cgColor]
        guard let gradient = CGGradient(
            colorsSpace: CGColorSpaceCreateDeviceRGB(),
            colors: colors as CFArray,
            locations: nil
            ) else { return }


        // Draw the gradient in image context
//        context.drawLinearGradient(
//            gradient,
//            start: CGPoint.zero,
//            end: CGPoint(x: size.width, y: 5), // Horizontal gradient
//            options: []
//        )

        context.drawLinearGradient(
            gradient,
            start: CGPoint(x: 0.5, y: 0),
            end: CGPoint(x: 0.5, y: size.height), // Horizontal gradient
            options: []
        )

        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            // Set the textColor to the new created gradient color
            self.textColor = UIColor(patternImage: image)
        }

    }
}
