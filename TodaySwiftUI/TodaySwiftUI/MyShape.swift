//
//  MyShape.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyShape: View {
    var body: some View {
        Image(systemName: "sun.max.circle")
            .resizable()
            .clipShape(Circle())
//        Capsule()
//            .foregroundColor(.green)
//        RoundedRectangle(cornerRadius: 24)
//            .frame(height: 300)
//        Circle()
//        Rectangle()
//        Capsule()
//        Ellipse()
    }
}

struct MyShape_Previews: PreviewProvider {
    static var previews: some View {
        MyShape()
    }
}
