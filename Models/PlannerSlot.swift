//
//  PlannerSlot.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation


enum Periods:Int {
    case P1 = 0
    case P2 = 1
    case B1 = 2
    case P3 = 3
    case B2 = 4
    case P4 = 5
    case P5 = 6
    case P6 = 7
    case A1 = 8
}

struct LearningObjective {
    public var id: String
    public var title: String
    
    init (id _id:String, title _title:String){
        self.id = _id
        self.title = _title
    }
}

struct Lesson {
    
    public var id: String
    public var subject: String
    public var unit: String
    public var title: String
    public var learningObjectives: [LearningObjective]
    public var resources:[String]
    
    init(id _id:String, subject _sub:String, unit _unit:String, title _title:String, learningObjectives _lo:[LearningObjective], resources _resources:[String]){
        self.id = _id
        self.subject = _sub
        self.unit = _unit
        self.title = _title
        self.learningObjectives = _lo
        self.resources = _resources
    }
    
}


class PlannerSlot {
    
    public var start:Date = Date()
    public var end:Date = Date()
    public var title:String = "Not Set"
    
    public var className:String = "Not Set"
    public var roomName:String = "Not Set"
    
    public var lesson:Lesson
    
    init (start:Date, end:Date, title:String, className:String, roomName:String, lesson:Lesson){
        self.start = start
        self.end = end
        self.title = title
        self.className = className
        self.roomName = roomName
        self.lesson = lesson
    }
}

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
                lesson: Lesson(id: "L" + String(i), subject: subjectName, unit: "Unit 1",  title: lessonTitle,learningObjectives: [], resources: [])
                ))
            
            lastTimeUsed = endTime
        }
    }
    
    init(){
        self.date = Date()
        generateDummyData()
    }
}
