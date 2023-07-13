//
//  MyMethod.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/07.
//

import SwiftUI

func returnName() -> String {
    return "hyun3"
}


// 메소드 <- enum, struct, class 안에서 되는 함수

struct MyMethod: View {
    var body: some View {
        VStack {
            Text(returnName2())
            Text(returnName())
        }
    }
    func returnName2() -> String {
        return "hyun2"
    }
}

struct MyMethod_Previews: PreviewProvider {
    static var previews: some View {
        MyMethod()
    }
}
