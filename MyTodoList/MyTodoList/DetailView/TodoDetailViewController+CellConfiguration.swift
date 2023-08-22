//
//  TodoDetailViewController+CellConfiguration.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/22.
//

import UIKit

extension TodoDetailViewController {
    func defaultConfiguration(for cell: UICollectionViewListCell, at row: Row) -> UIListContentConfiguration {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = text(for: row)
        contentConfiguration.image = row.image
        return contentConfiguration
    }
    
    func headerConfiguration(fow cell: UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = title
        return contentConfiguration
    }
    
    func titleConfiguration(for cell: UICollectionViewListCell, with title: String?) -> TextFieldContentView.Configuration {
        var contentConfiguration = cell.textFieldConfiguration()
        contentConfiguration.text = title
        contentConfiguration.onChange = { [weak self] title in
            self?.draftTodoItem.title = title
        }
        return contentConfiguration
    }
    
    func dateConfiguration(for cell: UICollectionViewListCell, with date: Date) -> DatePickerContenView.Configuration {
        var contentConfiguration = cell.datePickerConfiguration()
        contentConfiguration.date = date
        contentConfiguration.onChange = { [weak self] dueDate in
            self?.draftTodoItem.dueDate = dueDate
        }
        return contentConfiguration
    }
    
    func memoConfiguration(for cell: UICollectionViewListCell, with memo: String?) -> TextViewContentView.Configuration {
        var contentconfiguration = cell.textViewConfiguration()
        contentconfiguration.text = memo
        contentconfiguration.onChange = { [weak self] memo in
            self?.draftTodoItem.memo = memo
        }
        return contentconfiguration
    }
    
    func text(for row: Row) -> String? {
        switch row {
        case .date:
            return todoItem.dueDate.dayAndTimeText
        case .memo:
            return todoItem.memo
        case .time:
            return todoItem.dueDate.formatted(date: .omitted, time: .shortened)
        case .title:
            return todoItem.title
        default: return nil
        }
    }
}
