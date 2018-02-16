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
        
        
        let day:TimeInterval = 60 * 60 * 24
        
        let sundayDate:Date = firstSunday
        let sundayDC:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: sundayDate)
        
        let mondayDate:Date = Date(timeInterval: day, since: sundayDate)
        let mondayDC:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: mondayDate)
        
        let tuesdayDate:Date = Date(timeInterval: day, since: mondayDate)
        let tuesdayDC:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: tuesdayDate)
        
        let wednesdayDate:Date = Date(timeInterval: day, since: tuesdayDate)
        let wednesdayDC:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: wednesdayDate)
        
        let thursdayDate:Date = Date(timeInterval: day, since: wednesdayDate)
        let thursdayDC:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: thursdayDate)
        
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
                        className: "",
                        roomName: "",
                        subject: "",
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
            
            /* Monday Slots */
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 07, min: 15),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 07, min: 25),
                        title: "FT",
                        className: "7C",
                        roomName: "LAB1",
                        subject: "Form",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 07, min: 25),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 08, min: 25),
                        title: "P1",
                        className: "10",
                        roomName: "LAB 2",
                        subject: "CS",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 08, min: 25),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 09, min: 25),
                        title: "P2",
                        className: "7C",
                        roomName: "LAB 2",
                        subject: "CS",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 09, min: 25),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 09, min: 40),
                        title: "B1",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 09, min: 40),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 10, min: 40),
                        title: "P3",
                        className: "9D",
                        roomName: "110",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 10, min: 40),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 11, min: 40),
                        title: "P4",
                        className: "7D",
                        roomName: "PC4",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 11, min: 40),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 12, min: 00),
                        title: "B2",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 12, min: 00),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 13, min: 00),
                        title: "P5",
                        className: "FREE",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 13, min: 00),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 14, min: 00),
                        title: "P6",
                        className: "10C",
                        roomName: "107",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 14, min: 40),
                        end: Date.createDate(year: mondayDC.year!, month: mondayDC.month!, day: mondayDC.day!, hour: 15, min: 00),
                        title: "AF1",
                        className: "KS3",
                        roomName: "LAB 2",
                        subject: "Maths",
                        unit : "Booster",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            /* Tuesday Slots */
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 07, min: 15),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 07, min: 25),
                        title: "FT",
                        className: "7C",
                        roomName: "LAB1",
                        subject: "Form",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 07, min: 25),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 08, min: 25),
                        title: "P1",
                        className: "8B",
                        roomName: "LAB 2",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 08, min: 25),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 09, min: 25),
                        title: "P2",
                        className: "7D",
                        roomName: "PC 4",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 09, min: 25),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 09, min: 40),
                        title: "B1",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 09, min: 40),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 10, min: 40),
                        title: "P3",
                        className: "7A",
                        roomName: "LAB 2",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 10, min: 40),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 11, min: 40),
                        title: "P4",
                        className: "10",
                        roomName: "LAb 2",
                        subject: "CS",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 11, min: 40),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 12, min: 00),
                        title: "B2",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 12, min: 00),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 13, min: 00),
                        title: "P5",
                        className: "10C",
                        roomName: "107",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 13, min: 00),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 14, min: 00),
                        title: "P6",
                        className: "7B",
                        roomName: "LAB 1",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 14, min: 40),
                        end: Date.createDate(year: tuesdayDC.year!, month: tuesdayDC.month!, day: tuesdayDC.day!, hour: 15, min: 00),
                        title: "AF1",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            /* Wednesday Slots */
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 07, min: 15),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 07, min: 25),
                        title: "FT",
                        className: "7C",
                        roomName: "LAB1",
                        subject: "Form",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 07, min: 25),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 08, min: 25),
                        title: "P1",
                        className: "8B",
                        roomName: "LAB 2",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 08, min: 25),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 09, min: 25),
                        title: "P2",
                        className: "7D",
                        roomName: "PC 4",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 09, min: 25),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 09, min: 40),
                        title: "B1",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 09, min: 40),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 10, min: 40),
                        title: "P3",
                        className: "7A",
                        roomName: "LAB 2",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 10, min: 40),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 11, min: 40),
                        title: "P4",
                        className: "10",
                        roomName: "LAb 2",
                        subject: "CS",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 11, min: 40),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 12, min: 00),
                        title: "B2",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 12, min: 00),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 13, min: 00),
                        title: "P5",
                        className: "10C",
                        roomName: "107",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 13, min: 00),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 14, min: 00),
                        title: "P6",
                        className: "7B",
                        roomName: "LAB 1",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 14, min: 40),
                        end: Date.createDate(year: wednesdayDC.year!, month: wednesdayDC.month!, day: wednesdayDC.day!, hour: 15, min: 00),
                        title: "AF1",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            /* Thursday Slots */
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 07, min: 15),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 07, min: 25),
                        title: "FT",
                        className: "7C",
                        roomName: "LAB1",
                        subject: "Form",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 07, min: 25),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 08, min: 25),
                        title: "P1",
                        className: "7C",
                        roomName: "LAB 2",
                        subject: "ICT",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 08, min: 25),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 09, min: 25),
                        title: "P2",
                        className: "FREE",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 09, min: 25),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 09, min: 40),
                        title: "B1",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 09, min: 40),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 10, min: 40),
                        title: "P3",
                        className: "9D",
                        roomName: "110",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 10, min: 40),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 11, min: 40),
                        title: "P4",
                        className: "7D",
                        roomName: "PC 4",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 11, min: 40),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 12, min: 00),
                        title: "B2",
                        className: "",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 12, min: 00),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 13, min: 00),
                        title: "P5",
                        className: "10C",
                        roomName: "107",
                        subject: "Maths",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 13, min: 00),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 14, min: 00),
                        title: "P6",
                        className: "FREE",
                        roomName: "",
                        subject: "",
                        unit : "",
                        lesson : "",
                        learningObjectives:[],
                        resources: []
            ),
            
            PlannerSlot(start: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 14, min: 40),
                        end: Date.createDate(year: thursdayDC.year!, month: thursdayDC.month!, day: thursdayDC.day!, hour: 15, min: 00),
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
