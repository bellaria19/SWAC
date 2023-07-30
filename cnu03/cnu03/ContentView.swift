//
//  ContentView.swift
//  cnu03
//
//  Created by 이현재 on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    
    var myName: String = "이현재"
    @State var myCount: Int = 0
    
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView(name: myName, count: $myCount)
            } label: {
                Text("안녕하세요 \(myName) \(myCount)개")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
