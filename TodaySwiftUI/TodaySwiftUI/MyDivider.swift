//
//  MyDivider.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyDivider: View {
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image(systemName: "heart")
                Divider()
                    .frame(height: 30)
                Text("Hyun")
                Divider()
                    .frame(height: 30)
            }
            Divider()
                .background(.red)
                .frame(width: 150)
            
            HStack {
                Image(systemName: "bolt")
                Divider()
                    .frame(height: 30)
                Text("Olivia")
                Divider()
                    .frame(height: 30)
            }
            Divider()
        }
    }
}

struct MyDivider_Previews: PreviewProvider {
    static var previews: some View {
        MyDivider()
    }
}
