//
//  UIViewX.swift
//  CustomViews
//
//  Created by Rashid Abbas on 07/02/2018.
//  Copyright © 2018 WorldCallTelecom. All rights reserved.
//

import UIKit

@IBDesignable
public class UIViewX: BaseView {
    
    override public func setupViews() {
        super.setupViews()
    }
    
    //MARK: Gradient
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
    @IBInspectable public var CornerRadious: CGFloat = 0{
        didSet{
            layer.cornerRadius = CornerRadious
        }
    }
    
    //MARK: Shadows
    @IBInspectable public var ShadowColor: UIColor = UIColor.clear{
        didSet{
            layer.shadowColor = ShadowColor.cgColor
        }
    }
    @IBInspectable public var ShadowOpacity: CGFloat = 0{
        didSet{
            layer.shadowOpacity = Float(ShadowOpacity)
        }
    }
    @IBInspectable public var ShadowRadious: CGFloat = 0{
        didSet{
            layer.shadowRadius = ShadowRadious
        }
    }
    @IBInspectable public var ShadowOffsetY: CGFloat = 0{
        didSet{
            layer.shadowOffset.height = ShadowOffsetY
        }
    }
    @IBInspectable public var ShadowOffsetX: CGFloat = 0{
        didSet{
            layer.shadowOffset.width = ShadowOffsetX
        }
    }
    
}

















