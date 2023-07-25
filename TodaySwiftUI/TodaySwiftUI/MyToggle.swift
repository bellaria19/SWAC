//
//  MyToggle.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyToggle: View {
    
    @State var isLightOn = false
    
    var body: some View {
        Toggle(isOn: $isLightOn) {
            Text(isLightOn ? "Light On" : "Light Off")
        }
        .toggleStyle(.switch)
        .tint(.red)
        .padding()
    }
}

struct MyToggle_Previews: PreviewProvider {
    static var previews: some View {
        MyToggle()
    }
}
