//
//  PlannerSlot.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation



struct PlannerSlot {
    
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
    
    
    
    init (start:Date, end:Date, title:String, className:String, roomName:String, subject:String, unit:String, lesson:String,
          learningObjectives:[String], resources:[String]){
        self.start = start
        self.end = end
        self.title = title
        self.className = className
        self.roomName = roomName
        self.subject = subject
        self.unit = unit
        self.lesson = lesson
        self.learningObjectives = learningObjectives
        self.resources = resources
    }
    
}


