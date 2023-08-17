//
//  DoneButton.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/16.
//

import UIKit

class DoneButton: UIButton {
    var id: TodoItem.ID?
}

extension TodoListViewController {
    @objc func didTapDoneButton(_ sender: DoneButton) {
        guard let id = sender.id else { return }
        completeTodoList(withId: id)
    }
}

