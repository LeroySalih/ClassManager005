//
//  LearningObjectiveViwe.swift
//  ClassManager005
//
//  Created by Leroy Salih on 13/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit


class LearningObjectivesView : UIView {
    
    ///////////////////////////////
    // Component State
    ///////////////////////////////
    
    public var learningObjectives:[LearningObjective]? {
        didSet {
            updateDisplay()
        }
    }
    
    ///////////////////////////////
    // UI Components
    ///////////////////////////////
    
    private var viewHeading:UILabel = {
    
        var viewLabel:UILabel = UILabel()
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.text = "Learning Objectives:"
        viewLabel.sizeToFit()
        viewLabel.backgroundColor = UIColor.brown
        
        return viewLabel
        
    }()
    
    private var learningObjectivesStackView: UIStackView = {
        
        var stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints  = false
        stackview.axis = .vertical
        return stackview
        
    }()
    
    ///////////////////////////////
    // Initialisers
    ///////////////////////////////
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.learningObjectives = []
        addSubviews()
        updateDisplay()
        
    }
    
    convenience init(_ learningObjectives: [LearningObjective]) {
        
        self.init(frame: CGRect.zero)
        self.learningObjectives = learningObjectives
        addSubviews()
        updateDisplay()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    ///////////////////////////////
    // Build UI
    ///////////////////////////////
    
    func addSubviews(){
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(viewHeading)
        addSubview(learningObjectivesStackView)
        
        NSLayoutConstraint.activate([
            
            viewHeading.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewHeading.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewHeading.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            viewHeading.heightAnchor.constraint(equalToConstant: 50),
            /*
            learningObjectivesStackView.topAnchor.constraint(equalTo: viewHeading.bottomAnchor, constant: 10),
            learningObjectivesStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            learningObjectivesStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            learningObjectivesStackView.heightAnchor.constraint(equalToConstant: 50)*/
        ])
        
    }
    
    func updateDisplay(){
        
        // Remove old views from the Stack View
        for sv in learningObjectivesStackView.arrangedSubviews
        {
            learningObjectivesStackView.removeArrangedSubview(sv)
            sv.removeFromSuperview()
        }
        
        // Add the new views to the Stack View
        if (self.learningObjectives?.count) != nil{
            for lo:LearningObjective in self.learningObjectives!{
                let newLabel:UILabel = UILabel()
                newLabel.translatesAutoresizingMaskIntoConstraints = false
                newLabel.text = lo.title
                learningObjectivesStackView.addArrangedSubview(newLabel)
            }
        }
        
    }
}
