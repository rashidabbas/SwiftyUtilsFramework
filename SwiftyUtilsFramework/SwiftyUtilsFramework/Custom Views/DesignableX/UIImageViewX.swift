//
//  UIImageViewX.swift
//  CustomViews
//
//  Created by Rashid Abbas on 07/02/2018.
//  Copyright © 2018 WorldCallTelecom. All rights reserved.
//
//
import UIKit
@IBDesignable
class UIImageViewX: UIImageView {
    var ShadowView: UIView!
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
    @IBInspectable var CornerRadious: CGFloat = 0{
        didSet{
            clipsToBounds = true
            layer.cornerRadius = CornerRadious
        }
    }
    @IBInspectable var PopIn: Bool = false
    @IBInspectable var PopInDuration: Double = 0.4
    @IBInspectable var PopInDelay: Double = 0
    @IBInspectable var PulseDelay: Double = 0
    //MARK: Shadow
    @IBInspectable var ShadowColor: UIColor = UIColor.clear{
        didSet{
            layoutSubviews()
        }
    }
    @IBInspectable var ShadowRadious: CGFloat = 0{
        didSet{
            layoutSubviews()
        }
    }
    @IBInspectable var ShadowOppacity: CGFloat = 0{
        didSet{
            layoutSubviews()
        }
    }
    @IBInspectable var ShadowOffset: CGSize = CGSize(width: 0, height: 0){
        didSet{
            layoutSubviews()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        if ShadowView != nil {
            ShadowView.removeFromSuperview()
        }
        ShadowView = UIView(frame: self.frame)
        ShadowView.clipsToBounds = false
        ShadowView.layer.shadowColor = ShadowColor.cgColor
        ShadowView.layer.shadowOffset = ShadowOffset
        ShadowView.layer.shadowRadius = ShadowRadious
        ShadowView.layer.shadowOpacity = Float(ShadowOppacity)
        ShadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.superview?.addSubview(ShadowView)
        self.superview?.bringSubviewToFront(self)
    }
    
    override func awakeFromNib() {
        superview?.awakeFromNib()
        if PopIn {
            transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            UIView.animate(withDuration: PopInDuration, delay: PopInDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                self.transform = CGAffineTransform.identity
            })
        }
        if PulseDelay > 0 {
            UIView.animate(withDuration: 1, delay: PulseDelay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.transform = CGAffineTransform.identity
            })
        }
    }
}
