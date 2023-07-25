//
//  MyNavigationStack.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyNavigationStack: View {
    var body: some View {
//        NavigationStack {
//            NavigationLink(destination: Text("My View 2")) {
//                VStack {
//                    ZStack {
//                        Color.yellow
//                        Text("test2")
//                    }
//                }
//            }.navigationTitle("title")
//        }
        NavigationStack {
            NavigationLink(value: 3) {
                Text("test3")
            }.navigationDestination(for: Int.self) { value in
                Text("Hyun tried \(value) times")
            }
        }
    }
}

struct MyNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationStack()
    }
}
