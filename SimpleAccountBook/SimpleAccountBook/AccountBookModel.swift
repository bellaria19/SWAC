//
//  AccountBookModel.swift
//  SimpleAccountBook
//
//  Created by 이현재 on 2023/07/30.
//

// import Foundation
import SwiftUI

enum AccountCategory: String {
    case none
    case saving
    case drink
    case food
    case transport
    
    var DisplayImoji: String {
        switch self {
        case .saving: return "💰"
        case .drink: return "☕️"
        case .food: return "🥘"
        default: return "💸"
        }
    }
    
    var Display: String {
        switch self {
        case .saving: return "저축"
        case .drink: return "커피/음료수"
        case .food: return "음식"
        default: return "소비"
        }
    }
}

class AccountData {
    
    var category: AccountCategory = .none
    var title: String = ""
    var account: String = "0"
    var date: Date = Date()
    
    init(category: AccountCategory, title: String, account: String) {
        self.category = category
        self.title = title
        self.account = account
    }
    init() {}
}

let DummyData: [AccountData] = [
    AccountData(category: .food, title: "저녁", account: "30,000"),
    AccountData(category: .saving, title: "2023 1월 첫 저축", account: "100,000")
]

