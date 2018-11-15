//
//  UIViewXRadialGradient.swift
//  DesignableXTesting
//
//  Created by Mark Moeykens on 1/27/17.
//  Copyright © 2017 Moeykens. All rights reserved.
//

import UIKit

@IBDesignable
public class UIViewXRadialGradient: UIView {
    
    @IBInspectable public var InsideColor: UIColor = UIColor.clear
    @IBInspectable public var OutsideColor: UIColor = UIColor.clear
    
    override public func draw(_ rect: CGRect) {
        let colors = [InsideColor.cgColor, OutsideColor.cgColor] as CFArray
        let endRadius = min(frame.width, frame.height) / 2
        let radialCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: radialCenter, startRadius: 0.0, endCenter: radialCenter, endRadius: endRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
}
