//
//  Lesson.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation

struct Lesson {
    
    public var id: String
    public var subject: String
    public var unit: String
    public var title: String
    public var learningObjectives: [LearningObjective]
    public var resources:[Resource]
    
    init(id _id:String, subject _sub:String, unit _unit:String, title _title:String, learningObjectives _lo:[LearningObjective], resources _resources:[Resource]){
        self.id = _id
        self.subject = _sub
        self.unit = _unit
        self.title = _title
        self.learningObjectives = _lo
        self.resources = _resources
    }
    
}
