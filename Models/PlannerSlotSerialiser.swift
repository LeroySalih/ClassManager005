//
//  PlannerSlotSerialiser.swift
//  ClassManager005
//
//  Created by Leroy Salih on 16/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import FirebaseFirestore

class PlannerSlotSerialiser {
    
    public var progressDelegate:SerialiserProgressDelegate?
    
    public var opsRemaining:Int = 0 {
        didSet {
            guard let p = progressDelegate else {return }
            p.opsRemaining(remaining: opsRemaining)
        }
    }
    

    public func save (db:Firestore, ps:PlannerSlot) {
        
        opsRemaining += 1
        
        var docRef:DocumentReference? = nil
        
        docRef = db.collection("PSlots").addDocument(data: ps.dictionary, completion: { (error) in
            if let error = error {
                print ("Error \(error)")
            } else {
                
                self.opsRemaining -= 1
                
                print ("updating PlannedDates collection")
                let plannerDate = Date.getDateKey(from: ps.start)
                
                var plannerDay:PlannerDay = PlannerDay(date: ps.start)
                
                db.collection("PlannerDays")
                    .document(plannerDay.label)
                    .setData(plannerDay.dictionary, completion: { (err) in
                        if let error = error  {
                            print ("Error \(error)")
                        } else {
                            print ("plannerDates updated")
                        }
                    })
                }
                
            })
        
        /*
            db.collection("PSlots")
                .document(docId)
                .collection("Slots")
                .document(ps.title)
                .setData(ps.dictionary){ err in
                    self.opsRemaining -= 1
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("\(ps.start) Document successfully written!")
                    }
            }
         */
        
    }
    
}
