//
//  TeacherTimetable.swift
//  ClassManager005
//
//  Created by Leroy Salih on 16/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation


class TeacherTimetable
{
    static public func createBlankTimetableForWeek (firstSunday:Date) -> [PlannerSlot]
    {
        let sundayDate:Date = firstSunday
        let sundayDC:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: sundayDate)
        
        let plannerSlots:[PlannerSlot] = [
            
            /* Sunday Slots */
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 07, min: 15),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 07, min: 25),
                        title: "FT",
                        className: "7C",
                        roomName: "LAB1",
                        subject: "Form",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 07, min: 25),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 08, min: 25),
                        title: "P1",
                        className: "FREE",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 08, min: 25),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 09, min: 25),
                        title: "P2",
                        className: "7D",
                        roomName: "PC1",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 09, min: 25),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 09, min: 40),
                        title: "B1",
                        className: "9D",
                        roomName: "110",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 09, min: 40),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 10, min: 40),
                        title: "P3",
                        className: "10C",
                        roomName: "107",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 10, min: 40),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 11, min: 40),
                        title: "P4",
                        className: "9D",
                        roomName: "110",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 11, min: 40),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 12, min: 00),
                        title: "B2",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 12, min: 00),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 13, min: 00),
                        title: "P5",
                        className: "FREE",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 13, min: 00),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 14, min: 00),
                        title: "P6",
                        className: "8B",
                        roomName: "LAB1",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 14, min: 40),
                        end: Date.createDate(year: sundayDC.year!, month: sundayDC.month!, day: sundayDC.day!, hour: 15, min: 00),
                        title: "AF1",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            
            ]
        
        return plannerSlots
        
    }
}
