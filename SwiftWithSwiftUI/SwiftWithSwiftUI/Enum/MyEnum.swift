//
//  MyEnum.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct MyEnum: View {
    @State var menu: Menu = .pork
    
    enum Menu {
        case beef, pork, chicken
    }
    
    var body: some View {
        
        switch menu {
        case .beef:
            Text("오늘 메뉴는 소고기")
        case .pork:
            Text("오늘 메뉴는 돼지고기")
        case .chicken:
            Text("오늘 메뉴는 닭고기")
        //default:
        //    Text("이것은 못만들어요")
        }
    }
    
//    @State var menu: Menu = .pork
//
//    enum Menu {
//        case beef, pork, chicken
//    }
//
//    var body: some View {
//        if menu == .beef{
//            Text("오늘 메뉴는 소고기")
//        } else if menu == .pork {
//            Text("오늘 메뉴는 돼지고기")
//        } else if menu == .chicken {
//            Text("오늘 메뉴는 닭고기")
//        } else {
//            Text("이걸 먹어?")
//        }
//    }
}

struct MyEnum_Previews: PreviewProvider {
    static var previews: some View {
        MyEnum()
    }
}
