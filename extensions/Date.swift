//
//  Date.swift
//  ClassManager005
//
//  Created by Leroy Salih on 16/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation

extension Date {
    static func createDate (year:Int, month:Int, day:Int, hour:Int, min: Int)-> Date {
        var dc:DateComponents = DateComponents()
        
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = hour
        dc.minute = min
        dc.timeZone = Calendar.current.timeZone
        
        return Calendar.current.date(from: dc)!
    }
    
    func startOfDay () -> Date? {
        var dc:DateComponents = DateComponents()
        var newComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        
        dc.year = newComponents.year
        dc.month = newComponents.month
        dc.day = newComponents.day
        dc.minute = 1
        dc.hour = 0
        
        return Calendar.current.date(from: dc)
        
    }
    
    func endOfDay () -> Date? {
        var dc:DateComponents = DateComponents()
        var newComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        
        dc.year = newComponents.year
        dc.month = newComponents.month
        dc.day = newComponents.day
        dc.minute = 59
        dc.hour = 23
        dc.second = 59
        
        return Calendar.current.date(from: dc)
        
    }
    
    static func getDateKey(from: Date)->String {
        let dtFormatter = DateFormatter()
        dtFormatter.timeZone = Calendar.current.timeZone
        dtFormatter.dateFormat = "yyyy-MM-dd"
        
        return dtFormatter.string(from: from)
    }
    
    static func displayDate (date:Date)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
}
