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
        
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    private func todoListLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
