//
//  TodoDetailViewController+Row.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/18.
//

import UIKit

extension TodoDetailViewController {
    enum Row: Hashable {
        case header(String)
        case date
        case memo
        case time
        case title
        case editableText(String?)
        case editableDate(Date)
        
        var imageName: String? {
            switch self {
            case .date: return "calendar.circle"
            case .memo: return "square.and.pencil"
            case .time: return "clock"
            default: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
    }
}
