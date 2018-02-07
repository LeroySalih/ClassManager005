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
 
    var classLabel : UILabel = {
        var textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textLabel.font = UIFont(name: "Avenir", size: 23)
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
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
        
    }
    func addSubviews(){
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        updateSubveiws()
        
        addSubview(classLabel)
        
        NSLayoutConstraint.activate([
        
            classLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            classLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            classLabel.widthAnchor.constraint(equalToConstant: 150),
            classLabel.heightAnchor.constraint(equalToConstant: 50),
            
            ])
    }
    
    
}
