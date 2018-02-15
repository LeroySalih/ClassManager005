//
//  PlannerSlot.swift
//  ClassManager005
//
//  Created by Leroy Salih on 06/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation



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


