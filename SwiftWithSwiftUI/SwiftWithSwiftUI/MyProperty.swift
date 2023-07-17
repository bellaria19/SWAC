//
//  MyProperty.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/07.
//

import SwiftUI

struct MyProperty: View {
    
    @State var koreanMoney: Int = 1000
    var japaneseMoney: Int {
        get {
            return koreanMoney / 10
        }
        set {
            koreanMoney = newValue * 10
        }
    }
    // 프로퍼티 - 저장 프로퍼티 <- 변수
    //        - 연산 프로퍼티
    
    var body: some View {
        VStack{
            Text("\(koreanMoney)원 있습니다.")
            Text("\(japaneseMoney)엔 있습니다.")
            
            Button {
                koreanMoney = 200
            } label: {
                Text("Button")
            }

        }
    }
}

struct MyProperty_Previews: PreviewProvider {
    static var previews: some View {
        MyProperty()
    }
}
