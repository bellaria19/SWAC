//
//  MonthStruct.swift
//  SimpleCalendar
//
//  Created by 이현재 on 2023/07/21.
//

import Foundation

struct MonthStruct {
    
    var monthType: MonthType
    var dayInt: Int
    
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType {
    case Previous
    case Current
    case Next
}
