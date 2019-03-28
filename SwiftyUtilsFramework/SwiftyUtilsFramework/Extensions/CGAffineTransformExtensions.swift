//
//  CGAffineTransformExtensions.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 27/03/2019.
//  Copyright © 2019 Rashid Abbas. All rights reserved.
//

import UIKit
public extension CGAffineTransform {
    func getAngle() -> Double {
        var angle = atan2(Double(self.b), Double(self.a))
        angle = angle * (180 / .pi);
        return angle
    }
}
