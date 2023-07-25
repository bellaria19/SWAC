//
//  MyProgress.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyProgress: View {
    
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            ProgressView("Loading...", value: progress, total: 100)
            ProgressView()
            Button {
                progress += 5
            } label: {
                Text("Go")
            }
        }
    }
}

struct MyProgress_Previews: PreviewProvider {
    static var previews: some View {
        MyProgress()
    }
}
