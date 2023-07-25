//
//  ContentView.swift
//  SimpleCalendar
//
//  Created by 이현재 on 2023/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.ignoresSafeArea()
                    .opacity(0.2)
                VStack {
                    CalendarView().environmentObject(DateHolder())
                        .padding()
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
