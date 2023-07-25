//
//  MyLabel.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyLabel: View {
    var body: some View {
        VStack {
            HStack {
                Text(Image(systemName: "bolt"))
                Text("Hyun")
            }
            Label("Hyun", systemImage: "bolt")
            
            
        }
    }
}

struct MyLabel_Previews: PreviewProvider {
    static var previews: some View {
        MyLabel()
    }
}
