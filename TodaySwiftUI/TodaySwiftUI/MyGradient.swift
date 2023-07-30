//
//  MyGradient.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyGradient: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue, Color.yellow]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            Text("1")
        }
    }
}

struct MyGradient_Previews: PreviewProvider {
    static var previews: some View {
        MyGradient()
    }
}
