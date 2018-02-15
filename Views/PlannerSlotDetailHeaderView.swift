//
//  PlannerSlotDetailHeaderView.swift
//  ClassManager005
//
//  Created by Leroy Salih on 11/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit


class PlannerSlotDetailHeaderView : UIView {
    
    /////////////////////////////////////////////////////////////////////////////////
    //
    // Arrange the Class Labels
    //
    /////////////////////////////////////////////////////////////////////////////////
    
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
    
    var roomLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 20)
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
    var classLabelStackView : UIStackView = {
      
        var stackView = UIStackView(frame: CGRect(x:0, y: 0, width: 100, height: 100))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(red: 0.3, green: 0, blue: 0, alpha: 0.5)
        
        stackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return stackView
    }()
    
    /////////////////////////////////////////////////////////////////////////////////
    //
    // Arrange the Subject Labels
    //
    /////////////////////////////////////////////////////////////////////////////////
    
    
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
    
    var lessonTitleLabel : UILabelVA = {
        var textLabel = UILabelVA(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 20)
        textLabel.textAlignment = .left
        textLabel.backgroundColor = .red
        textLabel.verticalAlignment = .top
        return textLabel
    }()
    
    var subjectLabelStackView: UIStackView = {
        var stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return stackView
    }()
    
    /////////////////////////////////////////////////////////////////////////////////
    //
    // Arrange the Stack Views
    //
    /////////////////////////////////////////////////////////////////////////////////
    
    var detailStackView: UIStackView = {
        
        var stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.backgroundColor = .red
        
        return stackView
    }()
    
    
    /////////////////////////////////////////////////////////////////////////////////
    //
    // Class State Variables
    //
    /////////////////////////////////////////////////////////////////////////////////
    
    public var plannerSlot:PlannerSlot? {
        didSet {
            updateSubviews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    convenience init(_ plannerSlot: PlannerSlot) {
        
        self.init(frame: CGRect.zero)
        self.plannerSlot = plannerSlot
        addSubviews()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
    func addSubviews(){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        classLabelStackView.addArrangedSubview(classLabel)
        classLabelStackView.addArrangedSubview(roomLabel)
        
        
        subjectLabelStackView.addArrangedSubview(subjectLabel)
        subjectLabelStackView.addArrangedSubview(unitLabel)
        subjectLabelStackView.addArrangedSubview(lessonTitleLabel)
        
        
        detailStackView.addArrangedSubview(classLabelStackView)
        detailStackView.addArrangedSubview(subjectLabelStackView)
        
        addSubview(detailStackView)
        
        
        NSLayoutConstraint.activate([
            
          //  classLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
          //  classLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
          //  roomLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 5),
          //  roomLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
          //  roomLabel.widthAnchor.constraint(equalTo: classLabel.widthAnchor),
          //  classLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
          //  classLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
            classLabelStackView.widthAnchor.constraint(equalToConstant: 150),
            
            detailStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            detailStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            ])
        
    }
    
    func updateSubviews(){
        //print ("Updating SubView \(String(describing: plannerSlot?.className))")
        
        classLabel.text = plannerSlot?.className
        roomLabel.text = plannerSlot?.roomName
        subjectLabel.text = plannerSlot?.lesson.subject
        unitLabel.text = plannerSlot?.lesson.unit
        lessonTitleLabel.text = plannerSlot?.lesson.title
        
        
        //classLabel.sizeToFit()
        //print("Class Label set to \(classLabel.text ?? "Not Set")"
    }
    
}
