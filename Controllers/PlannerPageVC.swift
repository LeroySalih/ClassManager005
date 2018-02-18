//
//  PlannerPageVC.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class PlannerPageVC : UIViewController
{
    //////////////////////////////////////////
    // UI Components
    //////////////////////////////////////////
    
    var plannerPageView : PlannerPageView = {
        
        var view: PlannerPageView = PlannerPageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    //////////////////////////////////////////
    // View Controller State
    //////////////////////////////////////////
    
    public var plannerSlot:PlannerSlot? {
        didSet {
            // Update the View.
            print ("[PlannerPage] Assinging Planner Slot to View")
            plannerPageView.plannerSlot = plannerSlot
        }
    }
    
    override func loadView() {
        print ("[PlannerPage] Creating Planner Page View")
        
        self.view = plannerPageView
    }
    
    override func viewDidLoad() {
    
        print ("[Planner Page] View loaded")
        //NSLayoutConstraint.activate(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
        
        
    }
}
