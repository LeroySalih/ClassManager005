//
//  UIColor.swift
//  ClassManager005
//
//  Created by Leroy Salih on 17/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    static func appColor() -> UIColor { return UIColor(red: 231, green: 231, blue: 231)}
    static func borderColor() -> UIColor { return UIColor(red: 75, green: 75, blue: 75)}
    static func pageBackground() -> UIColor { return UIColor(red: 247, green: 247, blue: 247)}
    
}
