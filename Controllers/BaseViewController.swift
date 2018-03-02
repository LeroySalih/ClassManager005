//
//  ViewController.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import UIKit
import FirebaseFirestore

class BaseViewController: UIViewController, PlannerSlotDelegate, SideMenuDelegate, SerialiserProgressDelegate, TextListVCDelegate, PlannerPageDelegate {
    
    
    func onAddButtonPressed() {
        print ("[BaseViewController]onAddButtonPressed")
        plannerEditPageVC.modalPresentationStyle = .overFullScreen
        plannerPageVC.present(plannerEditPageVC, animated: true) {
            print ("Edit Page Completed")
        }
    }
    
    
    var db:Firestore!

    // Data Is in Dictionary instead of array to support change events from Firestore
    var plannerDays:[Date:PlannerDay] = [:]
    
    var plannerSlots:[PlannerSlot] = []
    
    var plannerDay : PlannerDay = PlannerDay()
    
    let SPACER:CGFloat = 10.0
    
    var sideMenuBarView:UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    var plannerEditPageVC:PlannerPageEditVC = {
        return PlannerPageEditVC()
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

    func loadPlannerDays(){
        db.collection("PlannerDays").getDocuments { (snapshot, error) in
            if let error = error {
                print ("[BaseViewController]::LoadDays Error: \(error)")
                return
            }
            var plannerDays:[PlannerDay] = (snapshot?.documents.flatMap({ (document) -> PlannerDay? in
                return PlannerDay(dictionary: document.data())
            }))!
            
            //print (plannerDays)
            
            
            self.plannerDays = [:]
            snapshot!.documents
                    .flatMap({PlannerDay(dictionary: $0.data())})
                    .forEach({ (plannerDay) -> Void in
                        self.plannerDays[plannerDay.date] = plannerDay
                            })
            
            self.sideMenuBarVC.plannerDays = Array(self.plannerDays.values)
            if self.plannerDays.count > 0 {
                self.loadPlannerSlots(plannerDay:plannerDays[0])
            }
            
        }
    }
    
    func checkForUpdatesPlannerDays(){
        db.collection("PlannerDays").addSnapshotListener { (snapshot, error) in
            guard let snapshot = snapshot else {return}
            
            snapshot.documentChanges.forEach({ (diff) in
                if diff.type == .added {
                    let plannerDay = PlannerDay(dictionary: diff.document.data())
                    
                    print ("Adding \(plannerDay?.label)")
                    
                    self.plannerDays[(plannerDay?.date)!] = plannerDay
                }
                if diff.type == .removed {
                    let plannerDay = PlannerDay(dictionary: diff.document.data())
                    
                    print ("Removing \(plannerDay?.label)")
                    
                    self.plannerDays[(plannerDay?.date)!] = nil
                }
            })
            
            self.sideMenuBarVC.plannerDays = Array(self.plannerDays.values)
        }
    }
    
    func loadPlannerSlots (plannerDay:PlannerDay){
        
        db.collection("PSlots")
            .whereField("start", isGreaterThanOrEqualTo: plannerDay.date.startOfDay()!)
            .whereField("start", isLessThanOrEqualTo: plannerDay.date.endOfDay()!)
            .order(by: "start")
            .getDocuments(){ (snapshot, error) in
                
                if error != nil {
                    print (error!)
                } else {
                    print ("[BaseViewController]::loadPlannerSlots. Found \(snapshot?.documents.count) Planner Slots")
                    
                    self.plannerSlots = (snapshot?.documents.flatMap({ (document) -> PlannerSlot? in
                        var ps = PlannerSlot(dictionary: document.data())
                        ps?.key = document.documentID
                        return ps
                    }))!
                    
                    self.plannerSlotsVC.plannerSlots = self.plannerSlots
                    
                }
        }
    }
    
    
    
    func addSubviewController(vc:UIViewController){
        self.addChildViewController(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // intialise the connection to Firestore.
        db = Firestore.firestore()
        
        view.backgroundColor = UIColor.appColor()
        
        addSubviewController(vc: menuBarVC)
        addSubviewController(vc: sideMenuBarVC)
 
        
        //loadPlannerDays()
        checkForUpdatesPlannerDays()
        
        sideMenuBarVC.sideMenuEventsDelegate = self
        
        addSubviewController(vc: plannerSlotsVC)
        plannerSlotsVC.plannerSlotDelegate = self
        plannerSlotsVC.startAvoidingKeyboard()
        
        plannerPageVC.textListVCDelegate = self
        plannerPageVC.plannerPageDelegate = self
        
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
        plannerSlotsVC.plannerSlots = plannerSlots
        
    }
    
    func onGetDataClicked(){
        print("[BaseViewController]: onGetDataButton Clicked")
    //    loadPlannerSlots(docId: "2018-01-01")
        
    }
    
    func onDateChanged(plannerDay:PlannerDay){
        print ("[BaseViewController]::onDataChanged \(plannerDay.label) has been selected")
        loadPlannerSlots(plannerDay: plannerDay)
    }
    
    
    
    
    func addWeeklyTimetable (firstSunday:Date){
        
    }
    
    func onAddDataClicked(){
        
        //
        print ("[BaseViewController] Starting Data Upload")
        
        // Create the PlannerSlots, populated with known Timetable Details
        let firstSunday:Date = Date.createDate(year:2018, month: 01, day: 01, hour: 07, min: 0)
        let plannerSlots:[PlannerSlot] = TeacherTimetable.createBlankTimetableForWeek(firstSunday: firstSunday)
        let psSerialise:PlannerSlotSerialiser = PlannerSlotSerialiser()
        psSerialise.progressDelegate = self
        // Create connection to Firestore
        let fs = Firestore.firestore()
        
        // Serialise Each Planner
        plannerSlots.forEach { (ps) in
            psSerialise.save(db:fs, ps: ps)
        }
        
        //
        print ("[BaseViewController] Ending Data Upload")
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
    func onPlannerCellClicked(_ plannerSlot: PlannerSlot) {
        print("[BaseViewController] Received Planner Slot Clicked")
        plannerPageVC.plannerSlot = plannerSlot
    
    }
    
    ///////////////////////////////
    //  Serialiser Delegate Functions
    //
    ///////////////////////////////
    
    var sv:UIView = UIView()
    var showingWindow = false
    
    func opsRemaining(remaining: Int) {
        if (remaining == 0){
            
            UIViewController.removeSpinner(spinner: sv)
            showingWindow = false
            
            print ("finished writing data")
        } else {
            if (showingWindow == false){
                sv = UIViewController.displaySpinner(onView: self.view)
                showingWindow = true
            }
        
            print ("There are \(remaining) items to write")
        }
    }
    
    ///////////////////////////////
    // PlannerPageDelegate Functions
    //
    ///////////////////////////////
    
    func onNewLearningObjective(lo: String) {
        print("[BaseViewController]:: Adding onNewLearningObjective \(lo)")
    }
    
}

