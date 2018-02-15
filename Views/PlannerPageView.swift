//
//  PlannerSlotDetailView.swift
//  ClassManager005
//
//  Created by Leroy Salih on 07/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class PlannerPageView : UIView {
 
    ////////////////////////////////
    // UI Components
    ////////////////////////////////
 
    var classLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 72)
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .green
        textLabel.text = "Not Set"
        textLabel.sizeToFit()
        
        return textLabel
    }()
    
    var plannerSlotDetailHeaderView : PlannerSlotDetailHeaderView = {
       
        var stackView:PlannerSlotDetailHeaderView = PlannerSlotDetailHeaderView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    var learningObjectivesView : LearningObjectivesView = {
        var view = LearningObjectivesView(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
    
        return view
    }()
    
    var resourcesView : ResourcesView = {
        var view = ResourcesView(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    var pageStackView : UIStackView = {
        var stackView : UIStackView = UIStackView(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
       // stackView.distribution = .fill
        stackView.spacing = 10
        stackView.backgroundColor = .black
        return stackView
    }()
    
    ////////////////////////////////
    // Data Model
    ////////////////////////////////
    var plannerSlot: PlannerSlot? {
        didSet{
            print ("[PlannerSlotDetailView] Received New planner Slot")
            buildUI()
            updateSubVeiwData()
            
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
        backgroundColor = .green
        
    }
    
    convenience init(_ plannerSlot: PlannerSlot) {
        
        self.init(frame: CGRect.zero)
        self.plannerSlot = plannerSlot
        buildUI()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
    func updateLearningObjectives(){
        
    }
    
    func updateSubVeiwData(){
        plannerSlotDetailHeaderView.plannerSlot = plannerSlot
        learningObjectivesView.learningObjectives = plannerSlot?.lesson.learningObjectives
        resourcesView.resources = plannerSlot?.lesson.resources
    }
    
    func buildUI(){
        print("[PlannerSlotDetailView] Rebuilding UI")
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        // Remove old views from stack view.
        for sv in pageStackView.arrangedSubviews{
            pageStackView.removeArrangedSubview(sv)
            sv.removeFromSuperview()
        }
        
        // add the new stackView.
        pageStackView.addArrangedSubview(plannerSlotDetailHeaderView)
        pageStackView.addArrangedSubview(learningObjectivesView)
     //   pageStackView.addArrangedSubview(resourcesView)
        
        addSubview(pageStackView)
        
        NSLayoutConstraint.activate([
            pageStackView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor),
            pageStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            pageStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      //      pageStackView.heightAnchor.constraint(equalToConstant: 250)
            ])
    }
    
}
