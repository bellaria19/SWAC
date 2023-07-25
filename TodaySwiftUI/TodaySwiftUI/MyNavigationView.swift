//
//  MyNavigationView.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("My View1")) {
//                VStack {
//                    HStack {
//                        Text("Hello")
//                            .bold()
//                            .font(.system(size: 32))
//                            .foregroundColor(.black)
//                            .padding()
//                        Spacer()
//                    }
                    
                ZStack {
                    Color.green
                    Text("test")
                }
                
            }
            .navigationTitle("asdf")
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
