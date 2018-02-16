//
//  PlannerSlotDetailView.swift
//  ClassManager005
//
//  Created by Leroy Salih on 07/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit


class PlannerPageView : UIView
{
    
    var learningObjectives:[String] = ["Learing Objective 1", "Learing Objective 2",]
    var resources:[String] = ["Resource 1", "Resource 2",]
    
    var classLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.headingFont()
        label.textAlignment = .center
        return label
    }()
    
    var roomLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        label.textAlignment = .center
        
        return label
    }()
    
    var lessonLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        //    label.textAlignment = .center
        
        return label
    }()
    
    var unitLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        //    label.textAlignment = .center
        
        return label
    }()
    
    var subjectLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        //   label.textAlignment = .center
        
        return label
    }()
    
    var loLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        //   label.textAlignment = .center
        
        return label
    }()
    
    var resourcesLabel:UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.subHeadingFont()
        //   label.textAlignment = .center
        
        return label
    }()
    
    func updateUI(){
        classLabel.text = plannerSlot.className
        classLabel.sizeToFit()
        
        roomLabel.text = plannerSlot.roomName
        roomLabel.sizeToFit()
        
        lessonLabel.text = plannerSlot.title
        lessonLabel.sizeToFit()
        
        unitLabel.text = plannerSlot.unit
        unitLabel.sizeToFit()
        
        subjectLabel.text = plannerSlot.subject
        unitLabel.sizeToFit()
        
        loLabel.text = "Learning Objectives"
        loLabel.sizeToFit()
        
        resourcesLabel.text = "Resources"
        resourcesLabel.sizeToFit()
        
    }
    
    func buildUI(){
        
        let classStackView = UIStackView()
        classStackView.translatesAutoresizingMaskIntoConstraints = false
        classStackView.axis = .vertical
        classStackView.addArrangedSubview(classLabel)
        classStackView.addArrangedSubview(roomLabel)
        
        addSubview (classStackView)
        
        let lessonStackView = UIStackView()
        lessonStackView.translatesAutoresizingMaskIntoConstraints = false
        lessonStackView.axis = .vertical
        lessonStackView.addArrangedSubview(lessonLabel)
        lessonStackView.addArrangedSubview(unitLabel)
        lessonStackView.addArrangedSubview(subjectLabel)
        
        addSubview(lessonStackView)
        
        let loStackView:UIStackView = UIStackView()
        loStackView.translatesAutoresizingMaskIntoConstraints = false
        loStackView.axis = .vertical
        
        
        addSubview(loLabel)
        plannerSlot.learningObjectives.forEach({
            
            let label:UILabel = UILabel()
            label.text = $0
            label.sizeToFit()
            loStackView.addArrangedSubview(label)
        })
        
        addSubview(loStackView)
        
        addSubview(resourcesLabel)
        
        let resourcesStackView:UIStackView = UIStackView()
        resourcesStackView.translatesAutoresizingMaskIntoConstraints = false
        resourcesStackView.axis = .vertical
        
        
        plannerSlot.resources.forEach({
            let label:UILabel = UILabel()
            label.text = $0
            label.sizeToFit()
            resourcesStackView.addArrangedSubview(label)
        })
        
        addSubview(resourcesStackView)
        
        NSLayoutConstraint.activate([
            classStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            //    classStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            classStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            //   classStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            lessonStackView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor),
            lessonStackView.leadingAnchor.constraint(equalTo: classStackView.trailingAnchor, constant:10),
            
            loLabel.topAnchor.constraint(equalTo: classStackView.bottomAnchor, constant: 10),
            loLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            loStackView.topAnchor.constraint(equalTo:loLabel.bottomAnchor),
            loStackView.leadingAnchor.constraint(equalTo:safeAreaLayoutGuide.leadingAnchor),
            loStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            resourcesLabel.topAnchor.constraint(equalTo: loStackView.bottomAnchor, constant: 10),
            resourcesLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            resourcesStackView.topAnchor.constraint(equalTo: resourcesLabel.bottomAnchor, constant: 10),
            
            resourcesStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        backgroundColor = .green
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    public var plannerSlot: PlannerSlot! {
        didSet {
            // remove the sub views
            subviews.forEach({$0.removeFromSuperview()})
            
            // update the text labels
            updateUI()
            
            // construct and present the UI
            buildUI()
        }
    }
    
    convenience init(_ plannerSlot:PlannerSlot)
    {
        self.init(frame: CGRect.zero)
        self.plannerSlot = plannerSlot
    }
    
}

