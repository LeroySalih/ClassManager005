//: Playground - noun: a place where people can play

import UIKit
import Foundation

let dateString = "2015-01-01T07:25:00+03:00"
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxxxx"

// Create a new Date,in local timezone.

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
    
    static func displayDate (date:Date)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
}


let dt = Date.createDate(year: 2018 ,month:1,day:1,hour:7,min:25)

print ("Created date is \(dt) in GMT")
print ("In Local TZ \(Date.displayDate(date:dt))")

let dtComponents = Calendar.current.dateComponents([.year, .month], from: dt)

print ("The Year of the date is \(dtComponents.year!)")



