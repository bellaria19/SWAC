//
//  Date+Ext.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/10.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened)
        if Locale.current.calendar.isDateInToday((self)) {
            let timeFormat = NSLocalizedString("%@ 까지", comment: "오늘까지의 시간입니다.")
            return String(format: timeFormat, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString(("%@ %@ 까지"), comment: "날짜까지의 시간입니다.")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
}
