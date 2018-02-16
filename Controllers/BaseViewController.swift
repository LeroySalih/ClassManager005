//
//  ViewController.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import UIKit
import FirebaseFirestore

class BaseViewController: UIViewController, PlannerSlotDelegate, SideMenuDelegate {
    
    
    
    var plannerDay : PlannerDay = PlannerDay()
    
    let SPACER:CGFloat = 10.0
    
    var sideMenuBarView:UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    
    
    var sideMenuBarVC:SideMenuVC = {
        var sideMenuVC = SideMenuVC()
        
        return SideMenuVC()
    }()
    
    var menuBarVC:MenuBarVC = {
        return MenuBarVC()
    }()
    
    var plannerSlotsVC:PlannerSlotsVC = {
        return PlannerSlotsVC()
    }()
    
    var plannerPageVC:PlannerPageVC = {
        return PlannerPageVC()
    }()

    
    
    
    func addSubviewController(vc:UIViewController){
        self.addChildViewController(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        addSubviewController(vc: menuBarVC)
        addSubviewController(vc: sideMenuBarVC)
        sideMenuBarVC.sideMenuEventsDelegate = self
        
        addSubviewController(vc: plannerSlotsVC)
        plannerSlotsVC.plannerSlotDelegate = self
        
        addSubviewController(vc: plannerPageVC)
        
        NSLayoutConstraint.activate([
             menuBarVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             menuBarVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             menuBarVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             menuBarVC.view.heightAnchor.constraint(equalToConstant: 50),
             
             sideMenuBarVC.view.topAnchor.constraint(equalTo: menuBarVC.view.bottomAnchor),
             sideMenuBarVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             sideMenuBarVC.view.widthAnchor.constraint(equalToConstant: 200),
             sideMenuBarVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             
             plannerSlotsVC.view.topAnchor.constraint(equalTo: menuBarVC.view.bottomAnchor, constant: SPACER),
             plannerSlotsVC.view.leadingAnchor.constraint(equalTo: sideMenuBarVC.view.trailingAnchor, constant: SPACER),
             plannerSlotsVC.view.widthAnchor.constraint(equalToConstant: 200),
             plannerSlotsVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -SPACER),
            
             plannerPageVC.view.topAnchor.constraint(equalTo: menuBarVC.view.bottomAnchor, constant: SPACER),
             plannerPageVC.view.leadingAnchor.constraint(equalTo: plannerSlotsVC.view.trailingAnchor, constant: SPACER),
             plannerPageVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SPACER),
             plannerPageVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -SPACER)
             
        ])
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///////////////////////////////
    //  SideMenuDelegate Functions
    //
    ///////////////////////////////
    
    func onInitClicked() {
        print("[BaseViewController]: OnInitButton Clicked")
        
        // Initialise View Controller
        plannerSlotsVC.plannerSlots = plannerDay.slots
        
    }
    
    func onGetDataClicked(){
        print("[BaseViewController]: onGetDataButton Clicked")
        
        let db = Firestore.firestore()
        db.collection("PSlots")
            .document("2018-01-01")
            .collection("Slots")
            .order(by: "startTime")
            .getDocuments(){ (snapshot, error) in
            
            if error != nil {
                print (error!)
            } else {
                
                let plannerDay:PlannerDay = PlannerDay.create(forDate:Date(), from: snapshot!)
                self.plannerSlotsVC.plannerSlots = plannerDay.slots
                
            }
        }
    }
    
    
    
    
    
    func addWeeklyTimetable (firstSunday:Date){
        
    }
    
    func onAddDataClicked(){
        
        // Create the PlannerSlots, populated with known Timetable Details
        let firstSunday:Date = Date.createDate(year:2018, month: 01, day: 01, hour: 07, min: 0)
        let plannerSlots:[PlannerSlot] = TeacherTimetable.createBlankTimetableForWeek(firstSunday: firstSunday)
        let psSerialise:PlannerSlotSerialiser = PlannerSlotSerialiser()
        
        // Create connection to Firestore
        let fs = Firestore.firestore()
        
        // Serialise Each Planner
        plannerSlots.forEach { (ps) in
            psSerialise.to(db:fs, ps: ps)
        }
    
    }
    
    func onRemoveDataClicked() {
        print("[BaseViewController]: onRemoveDataButton Clicked")
        
        let db = Firestore.firestore()
        
        db.collection("people").document("LA").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
    }
    
    ///////////////////////////////
    //  SideMenuDelegate Functions
    //
    ///////////////////////////////
    func onPlannerCellClicked(_ plannerSlot: PlannerSlot?) {
        print("[BaseViewController] Received Planner Slot Clicked")
        plannerPageVC.plannerSlot = plannerSlot
    //    displayPageView.plannerSlot = plannerSlot
    }


}

