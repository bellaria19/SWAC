//
//  ContentView.swift
//  cnu04
//
//  Created by 이현재 on 2023/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var count: Int
    
    var body: some View {
        VStack {
            Text("이 갯수가 맞나요?")
            Stepper(value: $count, in: 0...5) {
                Text("갯수 \(count)")
            }
            Button {
            
            } label: {
                Text("주문하기")
            }

        }
    }
}

struct ContentView: View {
    
    @State var showModal: Bool = false
    let total: Int = 10
    @State var myCount: Int = 0
    let datas = ["data1", "data2", "data3"]
    
    var body: some View {
        
        VStack {
            Text("\(total - myCount)개 남음")
            
            Stepper(value: $myCount, in: 0...5) {
                Text("\(myCount)개 주문")
            }
            Button {
                showModal = true
            } label: {
                Text("주문하기")
            }
            .sheet(isPresented: $showModal) {
                HomeView(count: $myCount)
            }
        }
            
//        TabView {
//            HomeView()
//                .badge(2)
//                .tabItem {
//                    Label("Received", systemImage: "tray.and.arrow.down.fill")
//                }
//            Text("sent")
//                .tabItem {
//                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
//                }
//            Text("account")
//                .badge("!")
//                .tabItem {
//                    Label("Account", systemImage: "person.crop.circle.fill")
//                }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
