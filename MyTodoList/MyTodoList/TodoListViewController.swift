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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todoListLayout = todoListLayout()
        collectionView.collectionViewLayout = todoListLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: CellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        var reminderTitles = [String]()
        for reminder in TodoItem.dummyData {
            reminderTitles.append(reminder.title)
        }
        snapshot.appendItems(reminderTitles)
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }
    
    private func todoListLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
