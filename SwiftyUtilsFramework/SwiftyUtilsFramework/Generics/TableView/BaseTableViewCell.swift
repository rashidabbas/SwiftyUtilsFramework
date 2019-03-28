//
//  BaseTableViewCell.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 27/03/2019.
//  Copyright © 2019 Rashid Abbas. All rights reserved.
//


import Foundation
import UIKit

class BaseTableViewCell<V>: UITableViewCell {
    var item: V!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
