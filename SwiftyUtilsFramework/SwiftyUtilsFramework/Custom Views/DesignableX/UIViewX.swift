//
//  UIViewX.swift
//  CustomViews
//
//  Created by Rashid Abbas on 07/02/2018.
//  Copyright © 2018 WorldCallTelecom. All rights reserved.
//

import UIKit

@IBDesignable
class UIViewX: BaseView {
    
    override func setupViews() {
        super.setupViews()
    }
    
    //MARK: Gradient
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
    
    private func UpdateView()
    {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor , SecondColor.cgColor]
        if HorizontalGradient {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }else{
            layer.startPoint = CGPoint(x: 0.0, y: 0.0)
            layer.endPoint = CGPoint(x: 0.0, y: 1.0)
        }
    }
    
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
    @IBInspectable var CornerRadious: CGFloat = 0{
        didSet{
            layer.cornerRadius = CornerRadious
        }
    }
    
    //MARK: Shadows
    @IBInspectable var ShadowColor: UIColor = UIColor.clear{
        didSet{
            layer.shadowColor = ShadowColor.cgColor
        }
    }
    @IBInspectable var ShadowOpacity: CGFloat = 0{
        didSet{
            layer.shadowOpacity = Float(ShadowOpacity)
        }
    }
    @IBInspectable var ShadowRadious: CGFloat = 0{
        didSet{
            layer.shadowRadius = ShadowRadious
        }
    }
    @IBInspectable var ShadowOffsetY: CGFloat = 0{
        didSet{
            layer.shadowOffset.height = ShadowOffsetY
        }
    }
    @IBInspectable var ShadowOffsetX: CGFloat = 0{
        didSet{
            layer.shadowOffset.width = ShadowOffsetX
        }
    }
    
}

















