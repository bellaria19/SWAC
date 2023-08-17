//
//  TodoDetailViewController.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/16.
//

import UIKit

private let reuseIdentifier = "Cell"

class TodoDetailViewController: UICollectionViewController {
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>
    
    var todoItem: TodoItem
    private var dataSource: DataSource!
    
    init(todoItem: TodoItem) {
        self.todoItem = todoItem
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init((coder:) has not been implemented")
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
        let section = section(for: indexPath)
        switch (section, row) {
        case (.view, _):
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = text(for: row)
            contentConfiguration.image = row.image
            cell.contentConfiguration = contentConfiguration
        default: fatalError("no section and row")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        updateSnapshot()
            
//        collectionView.dataSource = dataSource
    }
    
    func pushDetailViewForTodoItem(withId id: TodoItem.ID) {
        let todoItem = todoList(withId: id)
        let viewController = TodoDetailViewController(todoItem: todoItem)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = todoList[indexPath.item].id
        pushDetailViewForTodoItem(withId: id)
        return false
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
        }
    }
    
    private func updateSnapshotForEditing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.title, .date, .memo])
        dataSource.apply(snapshot)
    }
    
    private func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([.view])
        snapshot.appendItems([Row.title, Row.date, Row.time, Row.memo], toSection: .view)
        dataSource.apply(snapshot)
    }
    
    private func section(for indexPath: IndexPath) -> Section {
        let sectionNumber = isEditing ? indexPath.section + 1 : indexPath.section
        guard let section = Section(rawValue: sectionNumber) else {
            fatalError("no matching section!")
        }
    }
}

extension TodoDetailViewController {
    enum Row: Hashable {
        case date
        case memo
        case time
        case title
        
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
