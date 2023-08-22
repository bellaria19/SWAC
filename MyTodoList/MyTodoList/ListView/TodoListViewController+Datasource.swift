//
//  TodoListViewController+Datasource.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/10.
//

import UIKit

extension TodoListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, TodoItem.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, TodoItem.ID>
    
    func updateSnapshot(reloading ids: [TodoItem.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(todoList.map{$0.id})
        //        var reminderTitles = [String]()
        //        for reminder in TodoItem.dummyData {
        //            reminderTitles.append(reminder.title)
        //        }
        //        snapshot.appendItems(reminderTitles)
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot)
    }
    
    func CellRegistrationHandler (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: TodoItem.ID) {
        let todoList = todoList[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = todoList.title
        contentConfiguration.secondaryText = todoList.dueDate.dayAndTimeText
        
        let doneButtonConfiguration = doneButtonConfiguation(for: todoList)
        
        cell.accessories = [
            .customView(configuration: doneButtonConfiguration),
            .disclosureIndicator(displayed: .always)
        ]
        cell.contentConfiguration = contentConfiguration
    }
    
    func todoList(withId id: TodoItem.ID) -> TodoItem {
        let index = todoList.indexOfTodoItem(withId: id)
        return todoList[index]
    }
    
    func updateTodoList(_ todoItem: TodoItem) {
        let index = todoList.indexOfTodoItem(withId: todoItem.id)
        todoList[index] = todoItem
    }
    
    func completeTodoList(withId id: TodoItem.ID) {
        var todoItem = todoList(withId: id)
        todoItem.isComplete.toggle()
        updateTodoList(todoItem)
        updateSnapshot(reloading: [todoItem.id])
    }
    
    private func doneButtonConfiguation(for todoitem: TodoItem) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = todoitem.isComplete ? "checkmark.circle.fill" : "circle.fill"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = DoneButton()
        button.addTarget(self, action: #selector(didTapDoneButton), for: .touchUpInside)
        button.id = todoitem.id
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
