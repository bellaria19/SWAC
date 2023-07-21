//
//  MyColor.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct MyColor: View {
    var body: some View {
//        Color(.blue)
//            .frame(width: 300, height: 300)
//            .clipShape(RoundedRectangle(cornerRadius: 30))
//        Color(red: 0.4, green: 0.2, blue: 0.7)
        Color(hue: 0.4, saturation: 0.2, brightness: 0.7)
    }
}

struct MyColor_Previews: PreviewProvider {
    static var previews: some View {
        MyColor()
    }
}
