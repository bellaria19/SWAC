//
//  TodoDetailViewController.swift
//  MyTodoList
//
//  Created by 이현재 on 2023/08/16.
//

import UIKit

class TodoDetailViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>
    
    var todoItem: TodoItem {
        didSet {
            onChange(todoItem)
        }
    }
    var draftTodoItem: TodoItem
    var isAddingNewTodoItem = false
    var onChange: (TodoItem) -> Void
    private var dataSource: DataSource!
    
    init(todoItem: TodoItem, onChange: @escaping (TodoItem) -> Void) {
        self.todoItem = todoItem
        self.draftTodoItem = todoItem
        self.onChange = onChange
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        listConfiguration.headerMode = .firstItemInSection
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init((coder:) has not been implemented")
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
        let section = section(for: indexPath)
        switch (section, row) {
        case (_, .header(let title)):
            cell.contentConfiguration = headerConfiguration(fow: cell, with: title)
        case (.view, _):
            cell.contentConfiguration = defaultConfiguration(for: cell, at: row)
        case (.title, .editableText(let title)):
            cell.contentConfiguration = titleConfiguration(for: cell, with: title)
        case (.date, .editableDate(let date)):
            cell.contentConfiguration = dateConfiguration(for: cell, with: date)
        case (.memo, .editableText(let memo)):
            cell.contentConfiguration = memoConfiguration(for: cell, with: memo)
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
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
//        switch (){
//        case .editing:
//        case .adding:
//        case .viewing:
        if editing {
            prepareForEditing()
        } else {
            if isAddingNewTodoItem {
                onChange(draftTodoItem)
            } else {
                prepareForViewing()
            }
        }
    }
    
    @objc func didCancelEdit() {
        draftTodoItem = todoItem
        setEditing(false, animated: true)
    }
    
    private func prepareForEditing() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelEdit))
        updateSnapshotForEditing()
    }
    
    private func updateSnapshotForEditing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.title, .date, .memo])
        snapshot.appendItems([.header(Section.title.name), .editableText(todoItem.title)], toSection: .title)
        snapshot.appendItems([.header(Section.date.name), .editableDate(todoItem.dueDate)], toSection: .date)
        snapshot.appendItems([.header(Section.memo.name), .editableText(todoItem.memo)], toSection: .memo)
        dataSource.apply(snapshot)
    }
    
    private func prepareForViewing() {
        navigationItem.leftBarButtonItem = nil
        if draftTodoItem != todoItem {
            todoItem = draftTodoItem
        }
        updateSnapshot()
    }
    
    private func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([.view])
        snapshot.appendItems([Row.header(""), Row.title, Row.date, Row.time, Row.memo], toSection: .view)
        dataSource.apply(snapshot)
    }
    
    private func section(for indexPath: IndexPath) -> Section {
        let sectionNumber = isEditing ? indexPath.section + 1 : indexPath.section
        guard let section = Section(rawValue: sectionNumber) else {
            fatalError("no matching section!")
        }
        return section
    }
}


