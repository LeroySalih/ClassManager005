//
//  PlannerDay.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import FirebaseFirestore

class PlannerDay {
    
    static func create(forDate plannerDate:Date, from snapshot: QuerySnapshot) -> PlannerDay{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd HH:MM:SS"
        
        let plannerDay:PlannerDay = PlannerDay()
        //dateFormatter.date(from: document.documentID)!
        
        plannerDay.date = plannerDate
        
        for document in snapshot.documents {
            
            let docID = document.documentID // P1
            let startTime:Date = (document.data()["startTime"] as? Date) ?? Date()
            let endTime:Date = (document.data()["endTime"] as? Date) ?? Date()
            let className:String = (document.data()["className"] as? String) ?? "Not Set"
            let roomName:String = (document.data()["roomName"] as? String) ?? "Not Set"
            let subject:String = (document.data()["subject"] as? String) ?? "Not Set"
            let unit:String = (document.data()["unit"] as? String) ?? "Not Set"
            let lessonTitle:String = (document.data()["unit"] as? String) ?? "Not Set"
            
            let learningObjectives:[String] = (document.data()["learningObjectives"] as? [String]) ?? []
            let resources:[String] = (document.data()["resources"] as? [String]) ?? []
            
            print ("Reporting: \(docID) \(startTime) \(endTime) \(learningObjectives.count) \(resources.count)")
            let pSlot = PlannerSlot(start: startTime, end: endTime, title: docID, className: className, roomName: roomName, subject: subject, unit: unit, lesson: lessonTitle, learningObjectives:learningObjectives, resources:resources)
        
            plannerDay.slots.append(pSlot)
        }

        return plannerDay
        
    }
    
    
    public var date:Date = Date()
    public var slots:[PlannerSlot] = []
    
    let dateFormatter = DateFormatter()
    
    func generateDummyData() {
        /*
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let title = ["P1", "P2", "BREAK1", "P3", "P4", "BREAK2", "P5", "P6", "AF1"]
        let times = [60, 60, 15, 60, 60, 20, 60, 60, 60]
        let subjectNames = ["Maths", "Comp Sci", "Computing"]
        let classNames:[String] = ["10C", "7A", "8B", "Free" ]
        let roomNames:[String] = ["107", "105", "PC1", ""]
        let lessonTitles:[String] = ["Fractions", "Decimals", "Pie Charts", "Sequences"]
        
        var lastTimeUsed: Date = dateFormatter.date(from: "2018/02/08 07:25")!
        
        var randomIndex: Int
        
        for i in 0..<title.count {
            
            let endTime = lastTimeUsed.addingTimeInterval(TimeInterval(times[i] * 60))
            
            randomIndex = Int(arc4random_uniform(UInt32(classNames.count - 1)))
            let className = classNames[randomIndex]
            
            randomIndex = Int(arc4random_uniform(UInt32(subjectNames.count - 1)))
            let subjectName = subjectNames[randomIndex]
            
            randomIndex = Int(arc4random_uniform(UInt32(roomNames.count - 1)))
            let roomName = roomNames[randomIndex]
            
            randomIndex = Int(arc4random_uniform(UInt32(lessonTitles.count - 1)))
            let lessonTitle = lessonTitles [randomIndex]
            
            slots.append (PlannerSlot(
                start: lastTimeUsed,
                end: endTime,
                title:title[i],
                className:className,
                roomName: roomName,
                lesson: Lesson(id: "L" + String(i),
                               subject: subjectName,
                               unit: "Unit 1",
                               title: lessonTitle,
                               learningObjectives: [
                                LearningObjective(id: "LO1", title:lessonTitle),
                                LearningObjective(id: "LO1", title:lessonTitle)
                    ],
                               resources: [
                                Resource(id: "R1", title: "Resource 1"),
                                Resource(id: "R2", title: "Resource 2"),
                                Resource(id: "R3", title: "Resource 3"),
                                
                    ])
            ))
            
            lastTimeUsed = endTime
        }
 */
    }
    
    init(){
        self.date = Date()
        generateDummyData()
    }
    
    init(plannerDayID:String, data:[String:Any]){
        
        
    }
}
