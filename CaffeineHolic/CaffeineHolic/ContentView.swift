//
//  ContentView.swift
//  CaffeineHolic
//
//  Created by CNU on 2023/07/07.
//

import SwiftUI

struct ContentView: View {

    @State private var dailyList = ["First", "Second"]
    @State var caffeine:CaffeineModel = CaffeineModel()
    @State var result: Bool = true
    
   // @State private var count: Int
    
    func incList() {
        dailyList.insert("New", at: 0)        
    }
    func incCoffee() {
        dailyList.insert("Get Some Coffee", at: 0)
        caffeine.doWakening()
    }

    func incStress() {
        dailyList.insert("Stress Up", at: 0)
        caffeine.doStress()
    }

    func getRest() {
        dailyList.insert("Rest", at: 0)
        caffeine.doRest()
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
                }
            }
            
            Spacer()
            Button("Go to Caffeine") {
                print("Click")
                incList()
            }
            
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
        HStack {
            VStack {
                List(dailyList, id: \.self){ item in
                    Text(item.description)
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

