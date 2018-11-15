//
//  BaseView.swift
//  Showing Booker
//
//  Created by Rashid Abbas on 12/07/2018.
//  Copyright © 2018 Showing Booker. All rights reserved.
//

import UIKit
@IBDesignable
open class BaseView: UIView {

    override open func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
   open func setupViews()  {

    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupViews()
//        fatalError("init(coder:) has not been implemented")
//    }
}
