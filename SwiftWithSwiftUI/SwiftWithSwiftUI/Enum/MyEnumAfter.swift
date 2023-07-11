//
//  MyEnumAfter.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/07.
//

import SwiftUI

enum Drink {
    case coffee(hasMilk: Bool)
    case juice
    case soft(color: Color)

    var name: String {
        switch self {
        case .coffee(hasMilk: let hasMilk):
            if hasMilk {
                return "Latte"
            } else {
                return "Americano"
            }
        case .juice:
            return "Juice"
        case .soft(color: let drinkColor):
            switch drinkColor {
            case .orange:
                return "환타"
            case .black:
                return "콜라"
            default:
                return "음료"
            }
        }
    }
}

struct MyEnumAfter: View {
    
    let myDrinks: Drink = .soft(color: .orange)
    
    var body: some View {
        VStack{
            Text(myDrinks.name)
        }
    }
}

struct MyEnumAfter_Previews: PreviewProvider {
    static var previews: some View {
        MyEnumAfter()
    }
}
