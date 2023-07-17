//
//  MyOptionalBinding.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct MyOptionalBinding: View {
    
    var nickName: String? = "Hyun"

    var body: some View {
//        guard let nickName = nickName else {
//            Text("nickName")
//        }
//        Text(nickName!)
        Text(nickName ?? "default")
//        if let nickName = nickName {
//            Text(nickName)
//        } else {
//            Text("default")
//        }
    }
}

struct MyOptionalBinding_Previews: PreviewProvider {
    static var previews: some View {
        MyOptionalBinding()
    }
}
