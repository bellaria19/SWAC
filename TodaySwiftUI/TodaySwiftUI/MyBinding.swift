//
//  MyBinding.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyBinding: View {
    
    @State var isTurnOn = false
    @State var myText: String = ""
    var body: some View {
        VStack {
            TextField("text", text: $myText)
            Toggle("토글", isOn: $isTurnOn)
            
            Toggle(isOn: $isTurnOn) {
                Label("토글 스위치", systemImage: "lock")
            }
        }
    }
}

struct MyBinding_Previews: PreviewProvider {
    static var previews: some View {
        MyBinding()
    }
}
