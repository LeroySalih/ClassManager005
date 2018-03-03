//
//  PlannerSlots2VC.swift
//  ClassManager005
//
//  Created by Leroy Salih on 02/03/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import UIKit

class PlannerSlotsVC : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var plannerSlotDelegate:PlannerSlotDelegate?
    public var plannerSlots:[PlannerSlot]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    let cellIdentifier = "Cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let ps = plannerSlots else { return 0}
        
        return ps.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let d = plannerSlotDelegate else {return }
        
        d.onPlannerCellClicked(plannerSlots![indexPath.row])
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        
        if cell.viewWithTag(1) == nil{
            
            let bgv = UIView()
            bgv.translatesAutoresizingMaskIntoConstraints = false
            bgv.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
            bgv.layer.cornerRadius = 10
            bgv.layer.borderWidth = 0.5
            bgv.layer.borderColor = UIColor.gray.cgColor
            //bgv.clipsToBounds = true
            
            cell.backgroundView = bgv
            
            let bgvInner = UIView()
            bgvInner.translatesAutoresizingMaskIntoConstraints  = false
            bgvInner.backgroundColor = .blue
            bgv.addSubview(bgvInner)
            
            
            let periodLab = UILabel()
            periodLab.translatesAutoresizingMaskIntoConstraints = false
            periodLab.tag = 1
            cell.contentView.addSubview(periodLab)
            
            let periodTitleLabel = UILabel()
            periodTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            periodTitleLabel.tag = 2
            cell.contentView.addSubview(periodTitleLabel)
            
            let classLabel = UILabel()
            classLabel.translatesAutoresizingMaskIntoConstraints = false
            classLabel.tag = 3
            cell.contentView.addSubview(classLabel)
            
            let roomLabel = UILabel()
            roomLabel.translatesAutoresizingMaskIntoConstraints = false
            roomLabel.tag = 4
            cell.contentView.addSubview(roomLabel)
            
            NSLayoutConstraint.activate([
                cell.contentView.heightAnchor.constraint(equalToConstant: 90),
                
                bgv.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 5),
                bgv.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 5),
                bgv.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -5),
                bgv.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -5),
                
                periodLab.topAnchor.constraint(equalTo: bgv.topAnchor, constant: 5),
                periodLab.heightAnchor.constraint(equalToConstant:20),
                periodLab.leadingAnchor.constraint(equalTo: bgv.leadingAnchor, constant: 5),
                periodLab.widthAnchor.constraint(equalToConstant: 100),
                
                periodTitleLabel.topAnchor.constraint(equalTo: periodLab.topAnchor),
                periodTitleLabel.heightAnchor.constraint(equalToConstant: 20),
                periodTitleLabel.trailingAnchor.constraint(equalTo: bgv.trailingAnchor),
                periodTitleLabel.leadingAnchor.constraint(equalTo: periodLab.trailingAnchor),
                
                classLabel.topAnchor.constraint(equalTo: periodLab.bottomAnchor, constant: 5),
                classLabel.leadingAnchor.constraint(equalTo: bgv.leadingAnchor, constant: 5),
                classLabel.widthAnchor.constraint(equalToConstant: 100),
                classLabel.heightAnchor.constraint(equalToConstant: 20),
                
                roomLabel.bottomAnchor.constraint(equalTo: bgv.bottomAnchor, constant: -5),
                roomLabel.trailingAnchor.constraint(equalTo: bgv.trailingAnchor, constant: -5),
                roomLabel.widthAnchor.constraint(equalToConstant: 100),
                roomLabel.heightAnchor.constraint(equalToConstant: 20),
                
                ])
            
        }
        
        let plannerSlot : PlannerSlot = plannerSlots![indexPath.row]
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let periodLab = cell.viewWithTag(1) as! UILabel
        periodLab.text =  "\(dateFormatter.string(from: plannerSlot.start)) to \(dateFormatter.string(from: plannerSlot.end)) (\(plannerSlot.title))"
        
        let periodTitleLab = cell.viewWithTag(2) as! UILabel
        periodTitleLab.text = plannerSlot.title
        
        let classLab = cell.viewWithTag(3) as! UILabel
        classLab.text = plannerSlot.className
        
        let roomLab = cell.viewWithTag(4) as! UILabel
        roomLab.text = plannerSlot.roomName
        
        return cell
        
    }
    
    var tableView : UITableView = {
        
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func loadView() {
        super.loadView()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints =  false 
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
            ])
    }
}
