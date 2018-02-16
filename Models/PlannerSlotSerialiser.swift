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
    
    public func to (db:Firestore, ps:PlannerSlot) {
        
        let docId = Date.getDateKey(from: ps.start)
            
            db.collection("PSlots")
                .document(docId)
                .collection("Slots")
                .document(ps.title)
                .setData([
                    "startTime": ps.start,
                    "endTime": ps.end,
                    "className": ps.className,
                    "roomName":ps.roomName,
                    "subject": ps.subject,
                    "unit": ps.unit,
                    "title": ps.title,
                    "learningObjectives" : [],
                    "resources": []
                    
                ]){ err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("\(ps.start) Document successfully written!")
                    }
            }
        
    }
    
}
