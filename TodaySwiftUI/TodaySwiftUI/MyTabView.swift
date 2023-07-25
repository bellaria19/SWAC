//
//  MyTabView.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            ZStack {
                Color.orange.ignoresSafeArea()
                Text("Hyun")
            }
                .tabItem {
                    Image(systemName: "bolt")
                    Text("item1")
//                    Label("item1", systemImage: "bolt")
                }
            Text("Hyun2")
                .tabItem {
                    Label("item2", systemImage: "heart")
                }
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
