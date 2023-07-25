//
//  MyAppear.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyAppear: View {
    
    @State var name: String = "NoName"
    @State var isPresented: Bool = false
    
    var body: some View {
        
        NavigationView {
            NavigationLink("Test") {
                Text("Sample")
                    .onAppear() {
                        print("On appear3")
                    }.onDisappear() {
                        print("on Disapper3")
                    }
            }
        }
        .onAppear() {
            print("On appear1")
        }.onDisappear() {
            print("on Disapper1")
        }
//        VStack {
//            Text(name)
//                .onAppear() {
//                    print("On Appear")
//                    name = "Hyun"
//                } .onDisappear() {
//                    print("On Disapper")
//                    name = "no name"
//                }
//                .sheet(isPresented: $isPresented) {
//                    Text("Modal")
//                }
//            Button {
//                isPresented.toggle()
//            } label: {
//                Text("Change")
//                    .onAppear() {
//                        print("On Appear 2")
//                    }.onDisappear() {
//                        print("On Disapper 2")
//                    }
//            }
//        }

    }
}

struct MyAppear_Previews: PreviewProvider {
    static var previews: some View {
        MyAppear()
    }
}
