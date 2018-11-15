//
//  UIButtonX.swift
//  CustomViews
//
//  Created by Rashid Abbas on 07/02/2018.
//  Copyright © 2018 WorldCallTelecom. All rights reserved.
//
//
import UIKit
@IBDesignable
class UIButtonX: UIButton {
    
    enum FromDirection: Int {
        case Top = 0
        case Right = 1
        case Bottom = 2
        case Left = 3
    }
    
    var ShadowView: UIView!
    var direction: FromDirection = .Left
    var AlphaBefore: CGFloat = 1
    static let buttonHeight: CGFloat = 45
    
    @IBInspectable var Animate: Bool = false
    @IBInspectable var AnimationDelay: Double = 0.2
    @IBInspectable var AnimateFrom: Int{
        get{
            return direction.rawValue
        }
        set(DirectionIndex){
            direction = FromDirection(rawValue: DirectionIndex) ?? .Left
        }
    }
    @IBInspectable var PopIn: Bool = false
    @IBInspectable var PopInDelay: Double = 0.4
    
    
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        self.layer.cornerRadius = CornerRadious
        if Animate {
            let OriginalFrame = frame
            if direction == .Bottom{
                frame = CGRect(x: frame.origin.x, y: frame.origin.y + 200, width: frame.width, height: frame.height)
            }
            UIView.animate(withDuration: 5, delay: AnimationDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.allowUserInteraction], animations: {
                self.frame = OriginalFrame
            }, completion: nil)
        }
        if PopIn {
            transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 5, delay: PopInDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
        if ShadowView == nil && ShadowOppacity > 0 {
            ShadowView = UIView(frame: self.frame)
            ShadowView.backgroundColor = .clear
            ShadowView.layer.shadowColor = ShadowColor.cgColor
            ShadowView.layer.shadowRadius = ShadowRadious
            ShadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.CornerRadious).cgPath
            ShadowView.layer.shadowOffset = ShadowOffset
            ShadowView.layer.shadowOpacity = Float(ShadowOppacity)
            ShadowView.layer.masksToBounds = true
            ShadowView.clipsToBounds = false
            self.superview?.addSubview(ShadowView)
            self.superview?.bringSubviewToFront(self)
        }
        
    }
    
    
    //MARK: Shadow
    @IBInspectable var ShadowColor: UIColor = UIColor.clear
    @IBInspectable var ShadowRadious: CGFloat = 0
    @IBInspectable var ShadowOppacity: CGFloat = 0
    @IBInspectable var ShadowOffset: CGSize = CGSize(width: 0, height: 0)
    
    //MARK: Border
    @IBInspectable var BorderColor: UIColor = UIColor.clear{
        didSet{
            layer.borderColor = BorderColor.cgColor
        }
    }
    @IBInspectable var BorderWidth: CGFloat = 0{
        didSet{
            layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable var CornerRadious: CGFloat = 10{
        didSet{
            layer.cornerRadius = CornerRadious
            layer.masksToBounds = CornerRadious > 0
        }
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        AlphaBefore = alpha
//        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction, animations: {
//            self.alpha = 0.4
//        })
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
//            self.alpha = self.AlphaBefore
//        })
    }
    
    // MARK: Gradient
    @IBInspectable var FirstColor: UIColor = UIColor.white{
        didSet{
            UpdateView()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.white{
        didSet{
            UpdateView()
        }
    }
    @IBInspectable var HorizontalGradient: Bool = false{
        didSet{
            UpdateView()
        }
    }
    
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    
    func UpdateView()
    {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor , SecondColor.cgColor]
        if HorizontalGradient {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint(x: 1, y: 0.5)
        }
        else{
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    
}



















