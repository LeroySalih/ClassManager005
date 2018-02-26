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
    
    var pageOuterView : UIView = {
        
        var pageView = UIView()
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        pageView.layer.borderWidth = 1
        pageView.layer.borderColor = UIColor.borderColor().cgColor
        pageView.layer.cornerRadius = 10
        pageView.backgroundColor = .pageBackground()
        //pageView.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: 5, height: 5), radius: 5, scale: true)
        pageView.layer.shadowColor = UIColor(red: 100, green: 100, blue: 100).cgColor
        pageView.layer.shadowOpacity = 1
        pageView.layer.shadowOffset = CGSize.zero
        pageView.layer.shadowRadius = 10
        
        return pageView
    }()
    
    var pageInnerView : UIView = {
        
        let pageInner:UIView = UIView()
        pageInner.translatesAutoresizingMaskIntoConstraints = false
        pageInner.layer.borderWidth = 1
        pageInner.layer.borderColor = UIColor.borderColor().cgColor
        pageInner.backgroundColor = .white
        
        return pageInner
    }()
 
    var pageHeaderView : PlannerPageHeader = {
        
        var pageHeaderView:PlannerPageHeader = PlannerPageHeader()
        pageHeaderView.translatesAutoresizingMaskIntoConstraints = false
        pageHeaderView.backgroundColor = .red
        return pageHeaderView
    }()
    
    var pageStackView:UIStackView = {
        var stackView:UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    var headingBorderView: UIView = {
        var view:UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 80, green: 227, blue: 184)
        view.layer.cornerRadius = 2
        view.layer.shadowColor = UIColor(red: 100, green: 100, blue: 100).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        return view
    }()
    
    //////////////////////////////////////////
    // View Controller State
    //////////////////////////////////////////
    
    public var plannerSlot:PlannerSlot? {
        didSet {
            // Update the View.
            print ("[PlannerPage] Assigning Planner Slot to View")
            guard let ps = plannerSlot else {return }
            plannerPageHeaderVC.plannerSlot = ps
            learningObjectivesListVC.list = ps.learningObjectives
            resourcesListVC.list = ps.resources
            
            //plannerPageView.plannerSlot = plannerSlot
        }
    }
    
    //////////////////////////////////////////
    // Child View Controllers
    //////////////////////////////////////////
    var learningObjectivesListVC : TextListVC = {
        let vc:TextListVC = TextListVC()
        vc.label = "Learning Objectives"
        vc.list = ["Item 1", "Item 2", "Item 3"]
        return vc
    }()
    
    var resourcesListVC : TextListVC = {
        let vc:TextListVC = TextListVC()
        vc.label = "Resources"
        vc.list = ["Item 1", "Item 2", "Item 3"]
        return vc
    }()
    
    var plannerPageHeaderVC : PlannerPageHeaderVC = {
        
        let vc:PlannerPageHeaderVC = PlannerPageHeaderVC()
        
        return vc
    }()
    
    override func loadView() {
        print ("[PlannerPage] Creating Planner Page View")
        
        plannerPageHeaderVC.didMove(toParentViewController: self)
        learningObjectivesListVC.didMove(toParentViewController: self)
        resourcesListVC.didMove(toParentViewController: self)
        
        pageStackView.addArrangedSubview(plannerPageHeaderVC.view)
        pageStackView.addArrangedSubview(headingBorderView)
        pageStackView.addArrangedSubview(learningObjectivesListVC.view)
        pageStackView.addArrangedSubview(resourcesListVC.view)
        
        pageOuterView.addSubview(pageInnerView)
        pageOuterView.addSubview(pageStackView)
        
        self.view = pageOuterView
    }
    
    override func viewDidLoad() {
    
        print ("[Planner Page] View loaded")
        
        let constraints:[NSLayoutConstraint] = [
           
            headingBorderView.heightAnchor.constraint(equalToConstant: 5),
            headingBorderView.leadingAnchor.constraint(equalTo: pageStackView.leadingAnchor),
            headingBorderView.trailingAnchor.constraint(equalTo: pageStackView.trailingAnchor),
            pageInnerView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pageInnerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pageInnerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            pageInnerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            pageStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            pageStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ]
        
        constraints.forEach { (constraint) in
            constraint.identifier = "[pageStackView]"
        }
        
        NSLayoutConstraint.activate(constraints)

        
    }
}
