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
public class UIButtonX: UIButton {
    
    enum FromDirection: Int {
        case Top = 0
        case Right = 1
        case Bottom = 2
        case Left = 3
    }
    
    public var ShadowView: UIView!
    var direction: FromDirection = .Left
    public var AlphaBefore: CGFloat = 1
    public static let buttonHeight: CGFloat = 45
    
    @IBInspectable public var Animate: Bool = false
    @IBInspectable public var AnimationDelay: Double = 0.2
    @IBInspectable public var AnimateFrom: Int{
        get{
            return direction.rawValue
        }
        set(DirectionIndex){
            direction = FromDirection(rawValue: DirectionIndex) ?? .Left
        }
    }
    @IBInspectable public var PopIn: Bool = false
    @IBInspectable public var PopInDelay: Double = 0.4
    
    
    override public func draw(_ rect: CGRect) {
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
    @IBInspectable public var ShadowColor: UIColor = UIColor.clear
    @IBInspectable public var ShadowRadious: CGFloat = 0
    @IBInspectable public var ShadowOppacity: CGFloat = 0
    @IBInspectable public var ShadowOffset: CGSize = CGSize(width: 0, height: 0)
    
    //MARK: Border
    @IBInspectable public var BorderColor: UIColor = UIColor.clear{
        didSet{
            layer.borderColor = BorderColor.cgColor
        }
    }
    @IBInspectable public var BorderWidth: CGFloat = 0{
        didSet{
            layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable public var CornerRadious: CGFloat = 10{
        didSet{
            layer.cornerRadius = CornerRadious
            layer.masksToBounds = CornerRadious > 0
        }
    }
    
    
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        AlphaBefore = alpha
//        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction, animations: {
//            self.alpha = 0.4
//        })
        return true
    }
    override public func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {
//            self.alpha = self.AlphaBefore
//        })
    }
    
    // MARK: Gradient
    @IBInspectable public var FirstColor: UIColor = UIColor.white{
        didSet{
            UpdateView()
        }
    }
    @IBInspectable public var SecondColor: UIColor = UIColor.white{
        didSet{
            UpdateView()
        }
    }
    @IBInspectable public var HorizontalGradient: Bool = false{
        didSet{
            UpdateView()
        }
    }
    
    override public class var layerClass: AnyClass{
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



















