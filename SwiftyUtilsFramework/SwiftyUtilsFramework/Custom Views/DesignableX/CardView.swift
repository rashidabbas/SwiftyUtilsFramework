//
//  CardView.swift
//  TaazaChicken
//
//  Created by Rashid Abbas on 10/04/2018.
//  Copyright © 2018 WorldCallTelecom. All rights reserved.
//
//
import UIKit
@IBDesignable
public class CardView: UIViewX {
    override public func setupViews() {
        super.setupViews()
        setupCardProperties()
    }
    
    func setupCardProperties()  {
        BorderWidth = 0.5
        FirstColor = .white
        SecondColor = .white
        BorderColor = .white
        ShadowColor = UIColor.black
        ShadowOpacity = 0.2
        ShadowOffsetY = 1
        ShadowRadious = 5
        CornerRadious = 5
    }
    
    
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupCardProperties()
//        fatalError("init(coder:) has not been implemented")
//    }
}
