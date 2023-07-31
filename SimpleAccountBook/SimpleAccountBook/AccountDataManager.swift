//
//  AccountDataManager.swift
//  SimpleAccountBook
//
//  Created by 이현재 on 2023/07/30.
//

import Foundation

class AccountDataManager: ObservableObject {
    
    static let ACCOUNT_DATA_LIST_KEY = "ACCOUNT_DATA_LIST_KEY"
    
    static let shared = AccountDataManager()
    
    @Published var acDataList: [AccountData] = []
    
    init() {
        if let data = UserDefaults.standard.value(forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY) as? Data {
            let accountList = try? PropertyListDecoder().decode([AccountData].self, from: data)
            if let list = accountList {
                acDataList = list
            }
        }
    }
    
    func getDummyData() -> [AccountData] {
        return [
            AccountData(category: .food, title: "저녁", account: "30,000"),
            AccountData(category: .saving, title: "2023 1월 첫 저축", account: "100,000")
        ]
    }
    
    func getList(Category acCate: AccountCategory) -> [AccountData] {
        if acDataList.isEmpty {
            return getDummyData()
        }
        
        var returnList: [AccountData] = acDataList
        if acCate != .none {
            returnList = []
            for acData in acDataList {
                if acData.category == acCate {
                    returnList.append(acData)
                }
            }
        }
        
        return acDataList
    }
    
    func add(AccounData acData: AccountData?) -> Bool {
        // add locallist
        if let data = acData {
            acDataList.append(data)
            // add save list
            UserDefaults.standard.set(try? PropertyListEncoder().encode(acDataList), forKey: AccountDataManager.ACCOUNT_DATA_LIST_KEY)
            return UserDefaults.standard.synchronize()
        }
        return false
    }
}
