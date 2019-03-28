//
//  UIViewExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 15/11/2018.
//  Copyright © 2018 Rashid Abbas. All rights reserved.
//

import UIKit
let kShapeDashed : String = "kShapeDashed"
func degree2radians(_ number: Double) -> Double {
    return number * .pi / 180
}
func radians2degree(_ number: Double) -> Double {
    return number * 180 / .pi
}
public extension UIView {
    
    func removeDashedBorder(_ view: UIView) {
        view.layer.sublayers?.forEach {
            if kShapeDashed == $0.name {
                $0.removeFromSuperlayer()
            }
        }
    }
    
    func drawBorder(borderWidth: CGFloat = 1, lineColor: UIColor) {
        let cornerRadius: CGFloat = 10
        let dashPattern1: NSInteger = 8
        let dashPattern2: NSInteger = 8
        //drawing
        let frame = self.bounds
        let _shapeLayer = CAShapeLayer()
        //creating a path
        let path = CGMutablePath()
        
        //drawing a border around a view
        path.move(to: CGPoint(x: 0, y: frame.size.height - cornerRadius))
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi, endAngle: -(.pi/2), clockwise: false)
        path.addLine(to: CGPoint(x: frame.size.width - cornerRadius, y: 0))
        path.addArc(center: CGPoint(x: frame.size.width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: -(.pi/2), endAngle: 0, clockwise: false)
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height - cornerRadius))
        path.addArc(center: CGPoint(x: frame.size.width - cornerRadius, y: frame.size.height - cornerRadius), radius: cornerRadius, startAngle: 0, endAngle: .pi/2, clockwise: false)
        path.addLine(to: CGPoint(x: cornerRadius, y: frame.size.height))
        path.addArc(center: CGPoint(x: cornerRadius, y: frame.size.height - cornerRadius), radius: cornerRadius, startAngle: .pi/2, endAngle: .pi, clockwise: false)
        
        //path is set as the _shapeLayer object's path
        _shapeLayer.path = path
        //        CGPathRelease(path);
        
        _shapeLayer.backgroundColor = UIColor.clear.cgColor
        _shapeLayer.frame = frame
        _shapeLayer.masksToBounds = false
        //        [_shapeLayer setValue:[NSNumber numberWithBool:NO] forKey:@"isCircle"];
        _shapeLayer.setValue(false, forKey: "isCircle")
        _shapeLayer.fillColor = UIColor.clear.cgColor
        _shapeLayer.strokeColor = lineColor.cgColor
        _shapeLayer.lineWidth = borderWidth
        _shapeLayer.lineDashPattern = [dashPattern1, dashPattern2] as [NSNumber]
        _shapeLayer.lineCap = CAShapeLayerLineCap.round
        _shapeLayer.name = kShapeDashed
        //_shapeLayer is added as a sublayer of the view, the border is visible
        self.layer.addSublayer(_shapeLayer)
        self.layer.cornerRadius = cornerRadius
    }
    
    func rotateByAngle(angle: Double) {
        UIView.animate(withDuration: 0.5, animations: {
            //            self.selectedImageView?.transform = self.selectedImageView!.transform.rotated(by: CGFloat(angles[self.index])) //CGFloat(Double.pi / 2)
            self.transform = CGAffineTransform(rotationAngle: CGFloat(degree2radians(angle)))
            print("Rotation Angel = \(self.transform.getAngle())")
        })
    }
    
    func dismissKeyboard() {
        self.endEditing(true)
    }
    
    
    
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

