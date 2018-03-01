//
//  PlannerPageEditVC.swift
//  ClassManager005
//
//  Created by Leroy Salih on 27/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class PlannerPageEditVC : UIViewController {
    
    @objc
    func onClosedClicked(){
        print ("[PlannerPageEditVC]onClosedClicked")
        dismiss(animated: true) {
            print ("[PlannerPageEditVC] dismis completed")
        }
    }
    
    var button:UIButton = {
        
        var button:UIButton = UIButton(frame:CGRect(x: 0, y: 0, width: 100, height: 50))
        
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onClosedClicked), for: .touchUpInside)
        return button
        
    }()
    
    var backgroundView:UIView = {
        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        
       
        
        return view
    }()
    override func loadView() {
       
        backgroundView.addBlurEffect()
        backgroundView.addSubview(button)
        self.view = backgroundView
        
    }
    
    override func viewDidLoad() {
        
        
    
    }
    
}
