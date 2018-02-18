//
//  UIFont.swift
//  ClassManager005
//
//  Created by Leroy Salih on 17/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static func RegisterFonts ()  {
        
        let cfURL = Bundle.main.url(forResource: "Roboto-Light", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
    }
}
