//
//  File.swift
//  ClassManager005
//
//  Created by Leroy Salih on 24/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

// This View Controller will display the list of items....
class TextListVC : UIViewController {
    
    var delegate:TextListVCDelegate?
    
    var list:[String] = [] {
        didSet {
            buildStackView()
        }
    }
    var label:String = "" {
        didSet {
            listTitleLabel.text = label
            listTitleLabel.sizeToFit()
        }
    }
    
    var listTitleLabel:UILabel = {
        
        var label:UILabel = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    @objc
    func onAddButtonPressed (){
        
        print ("[TextListVC]::onAddButtonPressed Add Button Pressed")
        guard let d = self.delegate else {return }
        print ("Calling Parent delegate")
        d.onAddButtonPressed()
        
    }
    var addButton:UIButton = {
        
        var button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onAddButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // Will hold each list item
    var textListStackView : UIStackView = {
        
        var stackView:UIStackView = UIStackView()
        // Use Constraints to layout the view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.backgroundColor = .blue
        
        return stackView
    }()
    
    func buildStackView(){
        textListStackView.subviews.forEach { (subView) in
            subView.removeFromSuperview()
        }
        
        let titleStackView:UIStackView = UIStackView()
        titleStackView.axis = .horizontal
        titleStackView.spacing = 8
        titleStackView.addArrangedSubview(listTitleLabel)
        titleStackView.addArrangedSubview(addButton)
        
        textListStackView.addArrangedSubview(titleStackView)
        
        // Add each item
        list.forEach { (item) in
            let label:UILabel = UILabel()
            label.text = item
            label.sizeToFit()
            textListStackView.addArrangedSubview(label)
        }
        
    }
    //
    override func loadView() {
        print ("[TextListViewController]::loadView Called")
        
        let view:UIView = UIView()
        
        // Use Constraints to layout the view
        view.translatesAutoresizingMaskIntoConstraints = false
        
        buildStackView()
        
        //
        view.addSubview(textListStackView)
        
        self.view = view
        
    }
    
    override func viewDidLoad() {
        print ("[TextListViewController]::viewDidload Called")
        
        //view.backgroundColor = .red
        
        let constraints:[NSLayoutConstraint] = [
            
            textListStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textListStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textListStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textListStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            ]
        constraints.forEach { (constraint) in
            constraint.identifier = "[TextListVC]"
        }
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    
}
