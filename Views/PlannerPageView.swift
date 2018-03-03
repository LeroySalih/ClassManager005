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
    
    /////////////////////////////////////
    // UI Components
    /////////////////////////////////////
    
    var classLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var roomLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subjectLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var unitLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lessonLabel: UILabel = {
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    var learningObjectivesView:TextListView = {
        
        var view:TextListView = TextListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view;
        
    }()
    
    var resourcesView: TextListView = {
        var view:TextListView = TextListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var pageStackView:UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .vertical
        
        return stackView
    }()
    
    func updateUI(){
        
        guard let ps = plannerSlot else { return }
        classLabel.text = ps.className
        classLabel.sizeToFit()
        classLabel.font = UIFont(name: "Roboto-Light", size:  36.0)
        
        roomLabel.text = ps.roomName
        roomLabel.sizeToFit()
        roomLabel.textAlignment = .center
        roomLabel.font = UIFont(name: "Roboto-Light", size:  14.0)
        roomLabel.textColor = UIColor.gray
        
        subjectLabel.text = ps.subject
        subjectLabel.sizeToFit()
        
        unitLabel.text = ps.unit
        unitLabel.font = UIFont(name: "Roboto-Light", size:  14.0)
        
        lessonLabel.text = ps.lesson
        lessonLabel.font = UIFont(name: "Roboto-Light", size:  14.0)
        
        learningObjectivesView.learningObjectives = ps.learningObjectives
        resourcesView.learningObjectives = ps.resources
        
    }
    
    func buildUI(){
        
        let backgroundVW:UIView = UIView()
        backgroundVW.translatesAutoresizingMaskIntoConstraints = false 
        backgroundVW.backgroundColor = UIColor.appColor()
        
        let pageView:UIView = UIView()
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
        //pageView.layer.shouldRasterize = true
        
        let pageInner:UIView = UIView()
        pageInner.translatesAutoresizingMaskIntoConstraints = false
        pageInner.layer.borderWidth = 1
        pageInner.layer.borderColor = UIColor.borderColor().cgColor
        pageInner.backgroundColor = .white
        
        backgroundVW.addSubview(pageView)
        backgroundVW.addSubview(pageInner)
        
        
        [classLabel, roomLabel, subjectLabel, unitLabel, lessonLabel, headingBorderView, learningObjectivesView, resourcesView].forEach { (view) in
            pageInner.addSubview(view)
        }

        addSubview(backgroundVW)
        
        NSLayoutConstraint.activate([
            
            backgroundVW.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundVW.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            backgroundVW.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            backgroundVW.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor),
            
            pageView.topAnchor.constraint(equalTo: backgroundVW.topAnchor, constant: 10),
            pageView.leadingAnchor.constraint(equalTo: backgroundVW.leadingAnchor, constant: 10),
            pageView.trailingAnchor.constraint(equalTo: backgroundVW.trailingAnchor, constant: -10),
            pageView.bottomAnchor.constraint(equalTo: backgroundVW.bottomAnchor, constant: -10),
            
            pageInner.topAnchor.constraint(equalTo: backgroundVW.topAnchor, constant: 30),
            pageInner.leadingAnchor.constraint(equalTo: backgroundVW.leadingAnchor, constant: 30),
            pageInner.trailingAnchor.constraint(equalTo: backgroundVW.trailingAnchor, constant: -30),
            pageInner.bottomAnchor.constraint(equalTo: backgroundVW.bottomAnchor, constant: -30),
            
            classLabel.topAnchor.constraint(equalTo: pageInner.topAnchor, constant: 10),
            classLabel.leadingAnchor.constraint(equalTo: pageInner.leadingAnchor, constant: 10),
            
            roomLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 5),
            roomLabel.leadingAnchor.constraint(equalTo: classLabel.leadingAnchor),
            roomLabel.trailingAnchor.constraint(equalTo: classLabel.trailingAnchor),
            
            subjectLabel.topAnchor.constraint(equalTo:classLabel.topAnchor),
            subjectLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 10),
            
            unitLabel.topAnchor.constraint(equalTo:subjectLabel.bottomAnchor, constant: 5),
            unitLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 10),
            
            lessonLabel.topAnchor.constraint(equalTo:unitLabel.bottomAnchor, constant: 5),
            lessonLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 10),
            
            headingBorderView.topAnchor.constraint(equalTo: lessonLabel.bottomAnchor, constant: 10),
            headingBorderView.leadingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            headingBorderView.trailingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            headingBorderView.heightAnchor.constraint(equalToConstant: 5),
            
            learningObjectivesView.topAnchor.constraint(equalTo: headingBorderView.bottomAnchor, constant: 10),
            learningObjectivesView.leadingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            learningObjectivesView.trailingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            learningObjectivesView.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            
            resourcesView.topAnchor.constraint(equalTo: learningObjectivesView.bottomAnchor, constant: learningObjectivesView.frame.height),
            resourcesView.leadingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            resourcesView.trailingAnchor.constraint(equalTo: pageInner.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            ])
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
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

