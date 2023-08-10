//
//  TodoItem.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/10.
//

import Foundation

struct TodoItem {
    var title: String
    var dueDate: Date
    var memo: String? = nil
    var isComplete: Bool = false
}

extension TodoItem {
    static var dummyData = [
        TodoItem(title: "1일 1커밋하기", dueDate: Date().addingTimeInterval(1000)),
        TodoItem(title: "운동하기", dueDate: Date().addingTimeInterval(2000)),
        TodoItem(title: "키보드 조립하기", dueDate: Date().addingTimeInterval(3000), isComplete: true)
    ]
}
