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
            sideMenuEventsDelegate?.onInitClicked()
        } else {
            print("[SideMenuVC]: No Delegate Found for onInitDataClicked Event")
        }
        
    }
    
    @objc
    func OnGetDataClicked(){
        print ("[SideMenuVC]: Get Data Clicked")
        
        if sideMenuEventsDelegate != nil {
            print("[SideMenuVC]: calling parent onGetDataClicked")
            sideMenuEventsDelegate?.onGetDataClicked()
        } else {
            print("[SideMenuVC]: No Delegate Found for onGetDataClicked Event")
        }
    }
    
    @objc
    func OnAddDataClicked(){
        print ("[SideMenuVC]: Add Data Clicked")
        
        if sideMenuEventsDelegate != nil {
            print("[SideMenuVC]: calling parent onAddDataClicked")
            sideMenuEventsDelegate?.onAddDataClicked()
        } else {
            print("[SideMenuVC]: No Delegate Found for onAddDataClicked Event")
        }
    }
    
    var initButton:UIButton = {
        
        var button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Intialise", for: .normal)
        button.addTarget(self, action: #selector(SideMenuVC.buttonClicked), for: .touchUpInside)
        return button
    }()
    
    var getDataButton:UIButton = {
        
        var button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Data", for: .normal)
        button.addTarget(self, action: #selector(SideMenuVC.OnGetDataClicked), for: .touchUpInside)
        
        return button
    }()
    
    var addDataButton:UIButton = {
        var button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Data", for: .normal)
        button.addTarget(self, action: #selector(SideMenuVC.OnAddDataClicked), for: .touchUpInside)
    
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
        self.view.addSubview(getDataButton)
        self.view.addSubview(addDataButton)
        
        NSLayoutConstraint.activate([
            initButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            initButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            initButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            initButton.heightAnchor.constraint(equalToConstant: 50),
            
            getDataButton.topAnchor.constraint(equalTo: initButton.bottomAnchor, constant: 5),
            getDataButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            getDataButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            getDataButton.heightAnchor.constraint(equalToConstant: 50),
            
            addDataButton.topAnchor.constraint(equalTo: getDataButton.bottomAnchor, constant: 5),
            addDataButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            addDataButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            addDataButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            ])
    }
}
