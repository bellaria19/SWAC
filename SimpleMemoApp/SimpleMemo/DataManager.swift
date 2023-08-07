//
//  DataManager.swift
//  SimpleMemoApp
//
//  Created by 이현재 on 2023/08/04.
//

import Foundation

extension Date {
    func String() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: self)
    }
    
    func fullString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: self)
    }
}

struct MemoItem: Identifiable, Codable {
    var id = UUID()
    var date = Date()
    var title: String
    var contents: String
}

class DataManager:ObservableObject {
    static let DATA_LIST_KEY = "DATA_LIST_KEY"
    static let shared = DataManager()
    
    @Published var dataList:[MemoItem] = []

    init() {
        if let data = UserDefaults.standard.value(forKey: DataManager.DATA_LIST_KEY) as? Data {
            let dataListItem = try? PropertyListDecoder().decode([MemoItem].self, from: data)
            if let list = dataListItem {
                dataList = list
            }
        }
    }
    
    func getList() -> [MemoItem] {
        let returnList: [MemoItem] = dataList
        return returnList
    }

    func dataSync() -> Bool {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(dataList), forKey: DataManager.DATA_LIST_KEY)
        return UserDefaults.standard.synchronize()
    }
    
    func add(MemoItem item: MemoItem?) -> Bool {
        if let data = item {
            dataList.append(data)
            return dataSync()
        }
        return false
    }
    
    func save(MemoItem aItem: MemoItem?) -> Bool {
        if let data = aItem {
            for (idx, item) in dataList.enumerated() {
                if item.id.hashValue == data.id.hashValue {
                    dataList.remove(at: idx)
                    dataList.append(item)
                }
            }
        }
        return false
    }
    
    func updateList() {
        let list = dataList
        dataList = list
    }
    
    func remove(_ indexSet: IndexSet) -> Bool {
        dataList.remove(atOffsets: indexSet)
        return dataSync()
    }
    
    func move(frome source: IndexSet, to destination: Int) -> Bool {
        dataList.move(fromOffsets: source, toOffset: destination)
        return dataSync()
    }
}
