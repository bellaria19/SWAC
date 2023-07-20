//
//  MyButton.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct MyButton: View {
    var body: some View {        
        Button {
            print("Hited2")
        } label: {
            Text("Hyun")
                .padding()
                .frame(width: 150)
                .background(.purple)
                .cornerRadius(13)
        }
        Button("Delete", role: .destructive) {
            print("deleted!")
        }
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton()
    }
}
