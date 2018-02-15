//
//  LearningObjectiveViwe.swift
//  ClassManager005
//
//  Created by Leroy Salih on 13/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit


class ResourcesView : UIView {
    
    ///////////////////////////////
    // Component State
    ///////////////////////////////
    
    public var resources:[Resource]? {
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
        viewLabel.text = "Recources:"
        viewLabel.sizeToFit()
        //viewLabel.backgroundColor = .red
        
        return viewLabel
        
    }()
    
    private var stackView: UIStackView = {
        
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
        self.resources = []
        addSubviews()
        updateDisplay()
        
    }
    
    convenience init(_ resources: [Resource]) {
        
        self.init(frame: CGRect.zero)
        self.resources = resources
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
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            viewHeading.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewHeading.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewHeading.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            viewHeading.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: viewHeading.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            ])
    }
    
    func updateDisplay(){
        
        // Remove old views from the Stack View
        for sv in stackView.arrangedSubviews
        {
            stackView.removeArrangedSubview(sv)
            sv.removeFromSuperview()
        }
        
        // Add the new views to the Stack View
        if (self.resources?.count) != nil{
            for lo:Resource in self.resources!{
                let newLabel:UILabel = UILabel()
                newLabel.translatesAutoresizingMaskIntoConstraints = false
                newLabel.text = lo.title
                stackView.addArrangedSubview(newLabel)
            }
        }
        
    }
}

