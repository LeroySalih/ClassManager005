//
//  PlannerSlot.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct PlannerSlot {
    
    
    public var key:String?
    public var start:Date = Date()
    public var end:Date = Date()
    public var title:String = "Not Set"
    
    public var className:String = "Not Set"
    public var roomName:String = "Not Set"
    
    public var subject:String = "Not Set"
    public var unit:String = "Not Set"
    public var lesson:String = "Not Set"
    
    public var learningObjectives:[String] = []
    public var resources:[String] = []
    
    //public var lesson:Lesson
    
    var dictionary:[String:Any] {
        return [
            "start":start,
            "end":end,
            "title":title,
            "className":className,
            "roomName":roomName,
            "subject":subject,
            "unit":unit,
            "lesson":lesson,
            "learningObjectives": learningObjectives,
            "resources" : resources
        ]
    }

    
}


extension PlannerSlot : DocumentSerializable {
    
    init?(dictionary: [String : Any]){
        guard let start = dictionary["start"] as? Date,
              let end = dictionary["end"] as? Date,
              let title = dictionary["title"] as? String,
              let className = dictionary["className"] as? String,
              let roomName = dictionary["roomName"] as? String,
              let subject = dictionary["subject"] as? String,
              let unit = dictionary["unit"] as? String,
              let lesson = dictionary["lesson"] as? String,
              let learningObjectives = dictionary["learningObjectives"] as? [String],
              let resources = dictionary["resources"] as? [String]
    
        else{
            return nil
                }
        
        self.init(
                    key:"Not Set",
                    start: start,
                    end: end,
                    title: title,
                    className:
                    className,
                    roomName: roomName,
                    subject: subject,
                    unit: unit,
                    lesson: lesson,
                    learningObjectives:learningObjectives,
                    resources: resources)
        
        }
    
}

extension PlannerSlot {
    
    init(
        start: Date,
        end: Date,
        title: String,
        className: String,
        roomName: String,
        subject: String,
        unit: String,
        lesson: String,
        learningObjectives:[String],
        resources: [String]){
        
        
        self.init(
            key:"Not Set",
            start: start,
            end: end,
            title: title,
            className:
            className,
            roomName: roomName,
            subject: subject,
            unit: unit,
            lesson: lesson,
            learningObjectives:learningObjectives,
            resources: resources)
    }
    
}

