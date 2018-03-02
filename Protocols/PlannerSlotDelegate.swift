//
//  PlannerCellDelegate.swift
//  ClassManager005
//
//  Created by Leroy Salih on 07/02/2018.
//  Copyright © 2018 Leroy Salih. All rights reserved.
//

import Foundation

protocol PlannerSlotDelegate: class {
    func onPlannerCellClicked (_ plannerSlot: PlannerSlot)
}
