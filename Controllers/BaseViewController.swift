//
//  ViewController.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, PlannerSlotDelegate {
    
    
    
    
    
    var plannerDay : PlannerDay = PlannerDay()
    
    var topMenuBarView:UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var sideMenuBarView:UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var plannerCell:UIView = {
      
        let view = UIView()
        
        //view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    var plannerCellStackView:UIStackView = {
        
        let view = UIStackView(frame: CGRect(x: 0, y: 0, width: 200, height: 500))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        view.axis = .vertical
        view.distribution = .fillEqually
        
        return view
    }()
    
    var displayPageView:PlannerSlotDetailView = {
      
        let view = PlannerSlotDetailView(frame: CGRect(x: 0, y: 0, width: 200, height: 500))
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        
        return view
    }()

    func onPlannerCellClicked(_ plannerSlot: PlannerSlot?) {
        print("New Planner Cell selected: \(plannerSlot!.start)")
        displayPageView.plannerSlot = plannerSlot
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        view.addSubview(topMenuBarView)
        view.addSubview(sideMenuBarView)
        view.addSubview(plannerCellStackView)
        view.addSubview(displayPageView)
        
    
        for plannerSlot in plannerDay.slots
        {
            let plannerCellView = PlannerSlotView(plannerSlot)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            plannerCellView.delegate = self 
            
            plannerCellStackView.addArrangedSubview(plannerCellView)
        }
        
        
        NSLayoutConstraint.activate([
             topMenuBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             topMenuBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             topMenuBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             topMenuBarView.heightAnchor.constraint(equalToConstant: 50),
            
            sideMenuBarView.topAnchor.constraint(equalTo: topMenuBarView.bottomAnchor),
            sideMenuBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sideMenuBarView.widthAnchor.constraint(equalToConstant:200),
            sideMenuBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            plannerCellStackView.topAnchor.constraint(equalTo: topMenuBarView.bottomAnchor, constant: 15),
            plannerCellStackView.leadingAnchor.constraint(equalTo: sideMenuBarView.safeAreaLayoutGuide.trailingAnchor, constant: 15),
            plannerCellStackView.widthAnchor.constraint(equalToConstant:200),
            plannerCellStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            
            displayPageView.leadingAnchor.constraint(equalTo: plannerCellStackView.trailingAnchor, constant: 15),
            displayPageView.topAnchor.constraint(equalTo: plannerCellStackView.topAnchor),
            displayPageView.bottomAnchor.constraint(equalTo: plannerCellStackView.bottomAnchor),
            displayPageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
        ])
            
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

