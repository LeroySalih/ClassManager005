//
//  SideMenu.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class SideMenuVC : UIViewController
{
    public var sideMenuEventsDelegate:SideMenuDelegate?
    
    @objc
    func buttonClicked(){
        print("[SideMenuVC]: Init Clicked")
        if sideMenuEventsDelegate != nil {
            print("[SideMenuVC]: calling parent Init Clicked")
            sideMenuEventsDelegate?.onOnitClicked()
        } else {
            print("[SideMenuVC]: Not calling parent Init Clicked")
        }
        
    }
    
    var initButton:UIButton = {
        
        var button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Intialise", for: .normal)
        button.addTarget(self, action: #selector(SideMenuVC.buttonClicked), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view = view
    }
    
    override func viewDidLoad() {
        print ("[SideMenuVC] View Loaded")
        
        self.view.addSubview(initButton)
        
        NSLayoutConstraint.activate([
            initButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            initButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            initButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            initButton.heightAnchor.constraint(equalToConstant: 50),
            
            ])
    }
}
