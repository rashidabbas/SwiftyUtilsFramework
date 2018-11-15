//
//  LabelWithRightImageView.swift
//  Showing Booker
//
//  Created by Rashid Abbas on 14/07/2018.
//  Copyright © 2018 Showing Booker. All rights reserved.
//
//
import UIKit

class LabelWithRightImageView: BaseView {
    
    let imageView: UIImageViewX = {
        let imageView = UIImageViewX()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let label: UILabelX = {
        let label = UILabelX()
        label.text = ""
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addSubview(label)
        imageView.anchor(leading: leadingAnchor, top: nil, trailing: nil, bottom: nil , padding: .init(top: 0, left: 5, bottom: 0, right: 0) , size: .init(width: 30, height: 30))
        imageView.centerYAnchor(to: self)
        
        label.anchor(leading: imageView.trailingAnchor, top: nil, trailing: nil, bottom: nil , padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        label.centerYAnchor(to: imageView)
    }
}
