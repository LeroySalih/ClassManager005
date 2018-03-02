//
//  PlannerPageVC.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class PlannerPageVC : UIViewController, TextListVCDelegate, UITextViewDelegate
{
    public var textListVCDelegate:TextListVCDelegate?
    public var plannerPageDelegate:PlannerPageDelegate?
    
    func onAddButtonPressed() {
        
        print ("[PlannerPageVC]onAddButtonPressed add button pressed")
        guard let d = textListVCDelegate else { return }
        d.onAddButtonPressed()
        
        
    }
    
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
    
    var editTextView: UIView = {
        
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    var editTextBox : UITextView = {
        
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.keyboardType = .default
        
        return text
    }()
    
    var editButtonBarView:UIView = {
        
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    var editButton:UIButton = {
        
        var button = UIButton(frame: CGRect(x:0, y:0, width: 50, height: 30))
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(onEditButtonClicked), for: .touchUpInside)
        return button
    }()
    
    @objc
    func onEditButtonClicked(){
        print("Clicked")
        
        isShowingEditView = !isShowingEditView
    
    }
    
    //////////////////////////////////////////
    // View Controller State
    //////////////////////////////////////////
    
    var isShowingEditView:Bool = false {
        didSet {
            var top:CGFloat = 0
            
            if !isShowingEditView {
                top = -60
                self.editButton.setTitle("Hide", for: .normal)
                editTextBox.text = ""
                startAvoidingKeyboard()
            } else {
                top = -30
                self.editButton.setTitle("Edit", for: .normal)
                stopAvoidingKeyboard()
            }
            
            UIView.animate(withDuration: Double(0.25), animations: {
                self.editTextViewTopConstraint?.constant = top
                self.view.layoutIfNeeded()
            })
        }
    }
    var editTextViewTopConstraint:NSLayoutConstraint?
    
    
    public var plannerSlot:PlannerSlot? {
        didSet {
            // Update the View.
            
            guard let ps = plannerSlot else {return }
            print ("[PlannerPage] Assigning Planner Slot to View \(ps.className)")
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
        
        editTextView.addSubview(editTextBox)
        editTextBox.delegate = self
        editButtonBarView.addSubview(editButton)
        
        plannerPageHeaderVC.didMove(toParentViewController: self)
        learningObjectivesListVC.didMove(toParentViewController: self)
        resourcesListVC.didMove(toParentViewController: self)
        
        pageStackView.addArrangedSubview(plannerPageHeaderVC.view)
        pageStackView.addArrangedSubview(headingBorderView)
        pageStackView.addArrangedSubview(learningObjectivesListVC.view)
        pageStackView.addArrangedSubview(resourcesListVC.view)
        pageOuterView.addSubview(pageInnerView)
        pageOuterView.addSubview(pageStackView)
        
        pageInnerView.addSubview(editTextView)
        pageInnerView.addSubview(editButtonBarView)
        
        
        learningObjectivesListVC.delegate = self
        
        self.view = pageOuterView
    }
    
    
    
    override func viewDidLoad() {
    
        print ("[Planner Page] View loaded")
        
        editTextViewTopConstraint = editTextView.topAnchor.constraint(equalTo: pageInnerView.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        
        let constraints:[NSLayoutConstraint] = [
           
            headingBorderView.heightAnchor.constraint(equalToConstant: 5),
            headingBorderView.leadingAnchor.constraint(equalTo: pageStackView.leadingAnchor),
            headingBorderView.trailingAnchor.constraint(equalTo: pageStackView.trailingAnchor),
            
            pageInnerView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pageInnerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pageInnerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            pageInnerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            editButtonBarView.topAnchor.constraint(equalTo: pageInnerView.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            editButtonBarView.leadingAnchor.constraint(equalTo: pageInnerView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            editButtonBarView.trailingAnchor.constraint(equalTo: pageInnerView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            editButtonBarView.heightAnchor.constraint(equalToConstant: 30),
            
            editTextViewTopConstraint!,
            
            editTextView.leadingAnchor.constraint(equalTo: pageInnerView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            editTextView.trailingAnchor.constraint(equalTo: pageInnerView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            editTextView.heightAnchor.constraint(equalToConstant: 30),
            
            editTextBox.topAnchor.constraint(equalTo: editTextView.topAnchor, constant: 5),
            editTextBox.bottomAnchor.constraint(equalTo: editTextView.bottomAnchor, constant: -5),
            editTextBox.leadingAnchor.constraint(equalTo: editTextView.leadingAnchor, constant: 5),
            editTextBox.trailingAnchor.constraint(equalTo: editTextView.trailingAnchor, constant: -5),
            
            pageStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            pageStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ]
        
        constraints.forEach { (constraint) in
            constraint.identifier = "[pageStackView]"
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    /* Updated for Swift 4 */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text != "\n" { return true }
        
        textView.resignFirstResponder()
        
        guard let d = plannerPageDelegate else {
            print ("[PlannerPageVC]:: no delegate for new learning objective")
            return false
            
        }
        
        isShowingEditView = !isShowingEditView
        
        d.onNewLearningObjective(lo: textView.text)
        
        
        
        return false
    }
    
    
}
