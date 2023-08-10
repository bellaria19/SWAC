//
//  TodoListViewController+Datasource.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/10.
//

import UIKit

extension TodoListViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func CellRegistrationHandler (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) {
        let todoList = TodoItem.dummyData[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = todoList.title
        contentConfiguration.secondaryText = todoList.dueDate.dayAndTimeText
        
        let doneButtonConfiguration = doneButtonConfiguation(for: todoList)
        
        cell.accessories = [
            .customView(configuration: doneButtonConfiguration)
        ]
        
        cell.contentConfiguration = contentConfiguration
    }
    
    private func doneButtonConfiguation(for todoitem: TodoItem) -> UICellAccessory.CustomViewConfiguration {
        
        let symbolName = todoitem.isComplete ? "checkmark.circle.fill" : "circle.fill"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
