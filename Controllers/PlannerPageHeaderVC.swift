//
//  PlannerPageHeaderVC.swift
//  ClassManager005
//
//  Created by Leroy Salih on 24/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class PlannerPageHeaderVC : UIViewController {
    
    var plannerSlot : PlannerSlot? {
        didSet {
            updateUI()
        }
    }
    
    var classLabel:UILabel = {
        
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.textColor = .black
        return label
        
    }()
    
    var roomLabel:UILabel = {
        
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.textColor = .black
        return label
        
    }()
    
    var subjectLabel:UILabel = {
        
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.textColor = .black
        return label
        
    }()
    
    var unitLabel:UILabel = {
        
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.textColor = .black
        return label
        
    }()
    
    var lessonLabel:UILabel = {
        
        var label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.textColor = .black
        return label
        
    }()
    
    
    var headerStackView:UIStackView = {
        
        var stackView:UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        return stackView
    }()
    
    var headerClassStackView:UIStackView = {
        
        var stackView:UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    var headerLessonStackView:UIStackView = {
        
        var stackView:UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    override func loadView() {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        headerClassStackView.addArrangedSubview(classLabel)
        headerClassStackView.addArrangedSubview(roomLabel)
        
        headerLessonStackView.addArrangedSubview(subjectLabel)
        headerLessonStackView.addArrangedSubview(unitLabel)
        headerLessonStackView.addArrangedSubview(lessonLabel)
        
        headerStackView.addArrangedSubview(headerClassStackView)
        headerStackView.addArrangedSubview(headerLessonStackView)
        
        view.addSubview(headerStackView)
        
        self.view = view
    }
    
    func updateUI(){
        
        guard let ps = plannerSlot else { return }
        
        classLabel.text = ps.className
        classLabel.sizeToFit()
        
        roomLabel.text = ps.roomName
        roomLabel.sizeToFit()
        
        subjectLabel.text = ps.subject
        subjectLabel.sizeToFit()
        
        unitLabel.text = ps.unit
        unitLabel.sizeToFit()
        
        lessonLabel.text = ps.unit 
        lessonLabel.sizeToFit()
        
    }
    
    override func viewDidLoad() {
        
        updateUI()
        
        let constraints = [
            
            view.heightAnchor.constraint(equalToConstant: 70),
            //label.heightAnchor.constraint(equalToConstant: 50),
            
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]
        
        constraints.forEach { (constraint) in
            constraint.identifier = "[PlannerPageHeaderVC]"
        //    constraint.isActive = true
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
