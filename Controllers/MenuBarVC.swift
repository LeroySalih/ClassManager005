//
//  MenuBarVC.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class MenuBarVC : UIViewController
{
    
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view = view
    }
    
    override func viewDidLoad() {
        print ("[MenuBarVC] MenuBarVC View Loaded")
        
    }
}
