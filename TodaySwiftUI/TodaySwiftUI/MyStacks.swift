//
//  MyStacks.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct MyStacks: View {
    var body: some View {
        //        ZStack {
        //            Color.blue.ignoresSafeArea()
        //            HStack {
        //                Text("1")
        //                Text("2")
        //                Text("3")
        //            }.background(.red)
        //
        //            VStack(alignment: .leading) {
        //                Text("1")
        //                Text("2")
        //                Text("3")
        //            }.background(.white)
        //        }
                VStack(alignment: .leading) {
                    Text("1")
                    Text("2")
                    Text("3")
                        .background(.blue)
                }
                .frame(width: 300, height: 200)
                .background(.orange)
    }
}

struct MyStacks_Previews: PreviewProvider {
    static var previews: some View {
        MyStacks()
    }
}
