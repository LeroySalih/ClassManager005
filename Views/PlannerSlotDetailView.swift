//
//  PlannerSlotDetailView.swift
//  ClassManager005
//
//  Created by Leroy Salih on 07/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class PlannerSlotDetailView : UIView {
 
    ////////////////////////////////
    // UI Components
    ////////////////////////////////
    
    var classLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 72)
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
    var roomLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 20)
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
    var subjectLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 20)
        textLabel.textAlignment = .left
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
    var unitLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 20)
        textLabel.textAlignment = .left
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
    
    
    var lessonTitleLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 20)
        textLabel.textAlignment = .left
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
    ////////////////////////////////
    // Data Model
    ////////////////////////////////
    var plannerSlot: PlannerSlot? {
        didSet{
            print ("Received New planner Slot")
            updateSubveiws()
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .green
        
    }
    
    convenience init(_ plannerSlot: PlannerSlot) {
        
        self.init(frame: CGRect.zero)
        self.plannerSlot = plannerSlot
        addSubviews()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func updateSubveiws(){
        classLabel.text = plannerSlot?.className
        roomLabel.text = plannerSlot?.roomName
        subjectLabel.text = plannerSlot?.lesson.subject
        unitLabel.text = plannerSlot?.lesson.unit
        lessonTitleLabel.text = plannerSlot?.lesson.title
        
    }
    func addSubviews(){
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        updateSubveiws()
        
        addSubview(classLabel)
        addSubview(roomLabel)
        addSubview(subjectLabel)
        addSubview(unitLabel)
        addSubview(lessonTitleLabel)
        
        NSLayoutConstraint.activate([
        
            classLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            classLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            classLabel.widthAnchor.constraint(equalToConstant: 150),
            classLabel.heightAnchor.constraint(equalToConstant: 60),
            
            roomLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 5),
            roomLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            roomLabel.widthAnchor.constraint(equalToConstant: 150),
            roomLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            subjectLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            subjectLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 5),
            subjectLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            subjectLabel.heightAnchor.constraint(equalToConstant: 30),
            
            unitLabel.topAnchor.constraint(equalTo: subjectLabel.bottomAnchor, constant: 5),
            unitLabel.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor, constant: 5),
            unitLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            unitLabel.heightAnchor.constraint(equalToConstant: 30),
            
            lessonTitleLabel.topAnchor.constraint(equalTo: unitLabel.bottomAnchor, constant: 5),
            lessonTitleLabel.leadingAnchor.constraint(equalTo: classLabel.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            lessonTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            lessonTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            ])
    }
    
    
}
