//
//  PlannerDay.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation

class PlannerDay {
    public var date:Date = Date()
    public var slots:[PlannerSlot] = []
    
    let dateFormatter = DateFormatter()
    
    func generateDummyData() {
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
                               resources: [])
            ))
            
            lastTimeUsed = endTime
        }
    }
    
    init(){
        self.date = Date()
        generateDummyData()
    }
}
