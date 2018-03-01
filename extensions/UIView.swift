//
//  UIView.swift
//  ClassManager005
//
//  Created by Leroy Salih on 27/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation

import UIKit


extension UIView {
    
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    
}
