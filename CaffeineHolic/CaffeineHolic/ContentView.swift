//
//  ContentView.swift
//  CaffeineHolic
//
//  Created by CNU on 2023/07/07.
//

import SwiftUI

struct Daily: Identifiable {
    var id = UUID()
    let title: String
}

struct ContentView: View {

    @State var caffeine:CaffeineModel = CaffeineModel()
    @State private var dailyList: [dailyItem] = []
    @State var result: Bool = true
    
   // @State private var count: Int
    
    
//    func incList() {
//        dailyList.insert("New", at: 0)
//    }
    func incCoffee() {
//        dailyList.insert("Get Some Coffee", at: 0)
        (result, dailyList) = caffeine.doWakening()
    }

    func incStress() {
//        dailyList.insert("Stress Up", at: 0)
        (result, dailyList) = caffeine.doStress()
    }

    func getRest() {
//        dailyList.insert("Rest", at: 0)
        (result, dailyList) = caffeine.doRest()
    }
    
    func resetState() {
        (result, dailyList) = caffeine.doReset()
    }

    
    var Buttons: some View {
        VStack{
            HStack(spacing: 20) {
                Text("")
                Spacer()
//                Text("Top Button")
                Button("Top Button"){
                    print("Top Button Click")
//                    result = caffeine.doRest()
                    (result, dailyList) = caffeine.doReset()
                }
            }
            
            Spacer()
//            Button("Go to Caffeine") {
//                print("Click")
//                incList()
//            }
            
            Spacer()
            
            Image(caffeine.getStateImg())
                .resizable()
                .frame(width: caffeine.imgFrame.width, height: caffeine.imgFrame.height)
            
            HStack() {
                Button() {
                    incStress()
                } label: {
                    Text("Get Stress")
                }
                .padding()
                .foregroundColor(.red)
                
                Button {
                    incCoffee()
                } label: {
                    Text("Get Coffee")
                }
                .padding()
                .foregroundColor(.brown)
                
                Button {
                    getRest()
                } label: {
                    Text("Get Rest")
                }
                .padding()
                .foregroundColor(.blue)
            }

        }
        .padding()
    }
    
    var DailyView: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                List(Array(dailyList.enumerated()), id: \.offset) {idx, item in
                    Text("#" + idx.description + " " + item.state.rawValue + " " + item.count.description)
                }
                Spacer()
                Text("")
            }
            .frame(width: 200)
            .opacity(0.3)
            Spacer()
        }
        .padding()
    }
    
    var body: some View {
        ZStack {
            DailyView
            Buttons
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

