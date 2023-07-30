//
//  MyPicker.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyPicker: View {
    
    @State var pickItem: Int = 1
    
    var body: some View {
        HStack {
            Text(pickItem.description)
                .padding()
            
            
            Picker(selection: $pickItem) {
                // Text 내부는 선택
                Text("1")
                    .tag(1)
                // tap는 선택 후 보여지는 것
                Text("2")
                    .tag(2)
            } label: {
                Text("Picker")
            }
            .pickerStyle(.segmented)
            .background(.green)
            .cornerRadius(13)
            .padding()
        }
    }
}

struct MyPicker_Previews: PreviewProvider {
    static var previews: some View {
        MyPicker()
    }
}
