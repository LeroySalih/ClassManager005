//
//  SideMenu.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class SideMenuVC : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    public var sideMenuEventsDelegate:SideMenuDelegate?
    
    //////////////////////////////////////
    // UIPicker Functions
    //////////////////////////////////////
    
    public var pickableDates:[String] = [] {
        didSet {
            pickerView.reloadAllComponents()
        }
    }
    
    public var plannerDays:[PlannerDay] = [] {
        didSet {
            self.pickableDates = plannerDays.flatMap({ (plannerDay) -> String in
                return plannerDay.label
            })
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickableDates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickableDates[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("[SideMenuVC]: Date Changed")
        if sideMenuEventsDelegate != nil {
            print("[SideMenuVC]: calling parent Init Clicked")
            sideMenuEventsDelegate?.onDateChanged(plannerDay: plannerDays[row])
        } else {
            print("[SideMenuVC]: No Delegate Found for onDateChanged Event")
        }
    }
    
    
    
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
    
    var pickerView:UIPickerView = {
        var picker:UIPickerView = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false 
        picker.backgroundColor = .white
        
        return picker
    }()
    
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view = view
    }
    
    override func viewDidLoad() {
        print ("[SideMenuVC] View Loaded")
        self.view.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.view.addSubview(initButton)
        self.view.addSubview(getDataButton)
        self.view.addSubview(addDataButton)
        
        NSLayoutConstraint.activate([
            
            pickerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            pickerView.heightAnchor.constraint(equalToConstant: 50),
            
            initButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 5),
            initButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            initButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            initButton.heightAnchor.constraint(equalToConstant: 50),
            
            getDataButton.topAnchor.constraint(equalTo: initButton.bottomAnchor, constant: 5),
            getDataButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            getDataButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            getDataButton.heightAnchor.constraint(equalToConstant: 50),
            
            addDataButton.topAnchor.constraint(equalTo: getDataButton.bottomAnchor, constant: 5),
            addDataButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            addDataButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            addDataButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            ])
    }
}
