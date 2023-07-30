//
//  MyNavigationLink.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyNavigationLink: View {
    var body: some View {
        NavigationStack {
            Form {
                NavigationLink("œ∑´®†¥¨ˆøπ“‘åß∂ƒƒ©˙∆˚¬…æΩ≈ç√∫˜µ≤≥÷") {
                    // NavigationLink 내부가 하나의 뷰
                    Text("Option")
                        .navigationTitle("0")
                }
                NavigationLink {
                    Text("destination")
                        .navigationTitle("1")
                } label: {
                    Text("go to")
                }
                
                NavigationLink {
                    Text("destination2")
                        .navigationTitle("2")
                } label: {
                    Label("go to 2", systemImage: "bolt")
                }
            }.navigationTitle("메인")
        }
    }
}

struct MyNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationLink()
    }
}
