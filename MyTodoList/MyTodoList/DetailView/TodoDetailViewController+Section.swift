//
//  TodoDetailViewController+Section.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/16.
//

import Foundation

extension TodoDetailViewController {
    enum Section: Int, Hashable {
        case view
        case title
        case date
        case memo
        
        
        var name: String {
            switch self {
            case .view:
                return ""
            case .title:
                return NSLocalizedString("Title", comment: "타이틀 섹션")
            case .date:
                return NSLocalizedString("Date", comment: "날짜 섹션")
            case .memo:
                return NSLocalizedString("Memo", comment: "메모 섹션")
                
            }
        }
    }
}
