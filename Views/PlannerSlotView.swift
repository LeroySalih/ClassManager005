//
//  PlannerSlotView.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit


class PlannerSlotView : UIView
{
    weak var delegate: PlannerSlotDelegate?
    public var isSelected:Bool = false {
        didSet {
            formatBackground()
        }
    }
    
    public var viewId:Int = 0
    
    var dateFormatter:DateFormatter = DateFormatter()
    
    var plannerSlot: PlannerSlot? {
        didSet{
            print("[PlannerSlotView] removing sub views")
            subviews.forEach({$0.removeFromSuperview()})
            
            addSubviews()
            updateDisplay()
            
        }
    }

    
    var plannerSlotTitleLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 11)
        return textLabel
    }()
    
    var classLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 18)
        return textLabel
    }()
    
    var roomLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 11)
        return textLabel
    }()
    
    var highlightBar : UIView = {
        
        var view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .borderHighlightColor()
        
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //addSubviews()
        //updateDisplay() 
        
    }
    
    convenience init(_ plannerSlot: PlannerSlot, isSelected: Bool, viewId:Int) {
        
        self.init(frame: CGRect.zero)
        self.plannerSlot = plannerSlot
        self.isSelected = isSelected
        self.viewId = viewId
        
        addSubviews()
        updateDisplay()
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        delegate?.onPlannerCellClicked(plannerSlot!)
        //print ("Touched \(dateFormatter.string(from: plannerSlot!.start))")
    }
    
    func updateDisplay (){
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        plannerSlotTitleLabel.text = "\(dateFormatter.string(from: plannerSlot!.start)) to \(dateFormatter.string(from: plannerSlot!.end)) (\(plannerSlot!.title))"
        classLabel.text = plannerSlot!.className
        roomLabel.text = plannerSlot!.roomName
        
    }
    
    
    func formatBackground(){
        if (self.isSelected){
            backgroundColor = UIColor.slotSelectedBackground()
            highlightBar.isHidden = false
        } else {
            backgroundColor = UIColor.slotNotSelectedBackground()
            highlightBar.isHidden = true
        }
    }
    
    func addSubviews() {
        
        formatBackground()
        
        layer.borderColor = UIColor.borderColor().cgColor
        layer.borderWidth = 1
        
        addSubview(plannerSlotTitleLabel)
        addSubview(classLabel)
        addSubview(roomLabel)
        addSubview(highlightBar)
        
        NSLayoutConstraint.activate([
            
            plannerSlotTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            plannerSlotTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            plannerSlotTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 5),
            plannerSlotTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            
            classLabel.topAnchor.constraint(equalTo: plannerSlotTitleLabel.bottomAnchor, constant: 1),
            classLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            classLabel.widthAnchor.constraint(equalToConstant: 150),
            classLabel.heightAnchor.constraint(equalToConstant: 20),
            
            roomLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: -5),
            roomLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            roomLabel.widthAnchor.constraint(equalToConstant: 50),
      //      roomLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            roomLabel.heightAnchor.constraint(equalToConstant:22),
            
            highlightBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            highlightBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            highlightBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            highlightBar.widthAnchor.constraint(equalToConstant: 10)
            

            ])
    }
    
    
    
    
}
