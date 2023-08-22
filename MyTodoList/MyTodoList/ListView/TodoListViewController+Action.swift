//
//  TodoListViewController+Action.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/22.
//

import UIKit

extension TodoListViewController {
    @objc func didTapDoneButton(_ sender: DoneButton) {
        guard let id = sender.id else { return }
        completeTodoList(withId: id)
    }
    
    @objc func didTapAddButton(_ sender: UIBarButtonItem) {
        let todoItem = TodoItem(title: "", dueDate: Date.now)
        let viewController = TodoDetailViewController(todoItem: todoItem) { [weak self] todoItem in
            self?.addTodoItem(todoItem)
            self?.updateSnapshot()
            self?.dismiss(animated: true)
        }
        
        viewController.isAddingNewTodoItem = true
        viewController.setEditing(true, animated: false)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelAdd(_:)))
        viewController.navigationItem.title = NSLocalizedString("Add TodoItem", comment: "새로 할 일을 추가합니다.")
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
    }
    
    @objc func didCancelAdd(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}


