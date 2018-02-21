//
//  PlannerDay.swift
//  ClassManager005
//
//  Created by Leroy Salih on 14/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct PlannerDay {

    public var date:Date = Date()
    
    var dictionary:[String:Any]{
        return ["date":date]
    }
    
    public var label:String {
        return Date.getDateKey(from: date)
    }
}

extension PlannerDay : DocumentSerializable {
    
    init?(dictionary: [String : Any]){
        guard let date = dictionary["date"] as? Date else {print ("[PlannerDay]::init incorrect initialisation"); return nil}
        
        self.init(date:date)
    }
}
