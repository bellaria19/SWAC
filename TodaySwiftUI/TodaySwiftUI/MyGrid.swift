//
//  MyGrid.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyGrid: View {
    
    private var number: Int = 1
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 0, maximum: 200)),
                                GridItem(),
                                GridItem()]) {
                
                ForEach(1..<10) { num in
                    Text(num.description)
                        .frame(width: 100, height: 100)
                        .background(.purple)
                }
            }
//            Spacer()
//            LazyHGrid(rows: [GridItem(),
//                                GridItem(),
//                             GridItem()], alignment: .top) {
//                
//                ForEach(1..<10) { num in
//                    Text(num.description)
//                        .frame(width: 100, height: 100)
//                        .background(.green)
//                }
//            }
        }
    }
}

struct MyGrid_Previews: PreviewProvider {
    static var previews: some View {
        MyGrid()
    }
}
