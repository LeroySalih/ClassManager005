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
    
    var dateFormatter:DateFormatter = DateFormatter()
    
    var plannerSlot: PlannerSlot? {
        didSet{
            setNeedsDisplay()
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        delegate?.onPlannerCellClicked(plannerSlot)
        //print ("Touched \(dateFormatter.string(from: plannerSlot!.start))")
    }
    
    func addSubviews() {
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        plannerSlotTitleLabel.text = "\(dateFormatter.string(from: plannerSlot!.start)) to \(dateFormatter.string(from: plannerSlot!.end)) (\(plannerSlot!.title))"
        classLabel.text = plannerSlot!.className
        roomLabel.text = plannerSlot!.roomName
        
        addSubview(plannerSlotTitleLabel)
        addSubview(classLabel)
        addSubview(roomLabel)
        
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
            
            
            
        
            ])
    }
    
    
    
    
}
