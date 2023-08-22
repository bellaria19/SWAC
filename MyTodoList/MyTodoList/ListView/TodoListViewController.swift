//
//  TodoListViewController.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/10.
//

import UIKit

private let reuseIdentifier = "Cell"

class TodoListViewController: UICollectionViewController {
    
    var dataSource: DataSource!
    var todoList: [TodoItem] = TodoItem.dummyData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todoListLayout = todoListLayout()
        collectionView.collectionViewLayout = todoListLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: CellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: TodoItem.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton(_:)))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.style = .navigator
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    func pushDetailViewForTodoItem(withId id: TodoItem.ID) {
        let todoItem = todoList(withId: id)
        let viewController = TodoDetailViewController(todoItem: todoItem) { [weak self] todoItem in
            self?.updateTodoList(todoItem)
            self?.updateSnapshot(reloading: [todoItem.id])
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = todoList[indexPath.item].id
        pushDetailViewForTodoItem(withId: id)
        return false
    }
    
    private func todoListLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.trailingSwipeActionsConfigurationProvider = makeSwipeAction
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    func addTodoItem(_ todoItem: TodoItem) {
        todoList.append(todoItem)
    }
    
    func deleteTodoItem(withId id: TodoItem.ID) {
        let index = todoList.indexOfTodoItem(withId: id)
        todoList.remove(at: index)
    }
    
    private func makeSwipeAction(for indexPath: IndexPath?) -> UISwipeActionsConfiguration? {
        guard let indexPath = indexPath, let id = dataSource.itemIdentifier(for: indexPath) else { return nil }
        let deleteActionTitle = NSLocalizedString("Delete", comment: "삭제됩니다.")
        let deleteAction = UIContextualAction(style: .destructive, title: deleteActionTitle) { [weak self] _, _, completion in
            self?.deleteTodoItem(withId: id)
            self?.updateSnapshot()
            completion(false)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
