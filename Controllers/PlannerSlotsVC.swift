//
//  PlannerSlotsVC.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit


class PlannerSlotsOldVC : UIViewController, ReceivePlannerSlots, PlannerSlotDelegate
{
    var plannerSlotsStackView:UIStackView = UIStackView()
    
    public var plannerSlotDelegate: PlannerSlotDelegate?
    
    public var currentlySelected:Int = 0
    
    public var plannerSlots: [PlannerSlot] = [] {
        didSet {
            print("[PlannerSlotsVC] Planner Slots Received, rebuilding UI")
            buildUI()
        }
    }
    
    var scrollView : UIScrollView = {
        
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: 250, height: 1000)
        return scrollView
        
    }()
        
    func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        return stackView
    }
    
    func buildPlannerSlotsStackView() -> UIStackView {
        
        let stackView = createStackView()
        
        for (index, plannerSlot) in plannerSlots.enumerated() {
            let plannerCellView = PlannerSlotView(plannerSlot, isSelected: (index == currentlySelected), viewId: index)
            plannerCellView.delegate = self
            plannerCellView.tag = index
            stackView.addArrangedSubview(plannerCellView)
        }
        
        
        return stackView
    }
    
    func buildUI () {
        print ("[PlannerSlotsVC] Building UI")
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = UIColor.appColor()
        
        // remove existing subviews (if any)
        self.view.subviews.forEach({ $0.removeFromSuperview() })
        
        // Build and Populate the StackView
        plannerSlotsStackView = buildPlannerSlotsStackView()
        plannerSlotsStackView.backgroundColor = .white
        
        // Add the StackView to the ScrollView
        scrollView.addSubview(plannerSlotsStackView)
        
        // Add ScrollView to the View Hierachy
        self.view.addSubview(scrollView)
        
        // Establish Constraints to display the StackView
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            
            plannerSlotsStackView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 5),
            plannerSlotsStackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            plannerSlotsStackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            plannerSlotsStackView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor, constant: -5)
            ])
    }
    
    override func loadView() {
        
        print("[PlannerSlotsVC] Loading View")
       let v = UIView()
        
        self.view =  v
        
    }
    
    override func viewDidLoad() {
        print ("[PlannerSlotsVC] View Loaded")
        buildUI()
    }
    
    ///////////////////////////////
    //  PlannerSlotDelegate Functions
    //
    ///////////////////////////////
    
    func onPlannerCellClicked(_ plannerSlot: PlannerSlot?, sender: PlannerSlotView) {
        print("[PlannerSlotVC] Recieved onPlannerCellClicked")
        if plannerSlotDelegate != nil {
            print("[PlannerSlotVC] Sending onPlannerCellClicked")
            plannerSlotDelegate?.onPlannerCellClicked(plannerSlot, sender: sender)
            
            let currentlySelectedView = plannerSlotsStackView.arrangedSubviews[currentlySelected] as! PlannerSlotView
            currentlySelectedView.isSelected = false
            
            self.currentlySelected = sender.viewId
            
            let newlySelectedView = plannerSlotsStackView.arrangedSubviews[self.currentlySelected] as! PlannerSlotView
            newlySelectedView.isSelected = true
            
            
        }
    }
}
