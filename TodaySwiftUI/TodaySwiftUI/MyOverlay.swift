//
//  MyOverlay.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyOverlay: View {
    var body: some View {
        Circle()
            .foregroundColor(.green)
            .frame(width: 300, height: 300)
            .overlay {
//                Circle()
//                    .foregroundColor(.clear)
//                    .frame(width: 400, height: 400)
//                    .border(.yellow, width: 3)
                    targetView()
            }
    }
    @ViewBuilder
    func targetView() -> some View {
        Circle()
            .foregroundColor(.yellow)
            .frame(width: 200, height: 200)
        Circle()
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}

struct MyOverlay_Previews: PreviewProvider {
    static var previews: some View {
        MyOverlay()
    }
}
