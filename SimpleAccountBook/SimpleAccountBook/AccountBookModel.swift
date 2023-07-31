//
//  AccountBookModel.swift
//  SimpleAccountBook
//
//  Created by 이현재 on 2023/07/30.
//

// import Foundation
import SwiftUI

enum AccountCategory: String, CaseIterable, Codable {
    case none
    case saving
    case drink
    case food
    case transport
    
    var id: AccountCategory { self }
    
    var DisplayImoji: String {
        switch self {
        case .saving: return "💰"
        case .drink: return "☕️"
        case .food: return "🥘"
        case .transport: return "🚘"
        default: return "💸"
        }
    }
    
    var Display: String {
        switch self {
        case .saving: return "저축"
        case .drink: return "커피/음료수"
        case .food: return "음식"
        case .transport: return "여행"
        default: return "소비"
        }
    }
}

struct AccountData: Codable {
    
    var category: AccountCategory = .none
    var title: String = ""
    var account: String = "0"
    var date: Date = Date()
    
    init(category: AccountCategory, title: String, account: String) {
        self.category = category
        self.title = (title == "" ? category.Display : title)
        self.account = account
    }

}



