//
//  MyHexColor.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyHexColor: View {
    var body: some View {
        ZStack {
            VStack {
                Color(red: 0.3, green: 0.5, blue: 0.7)
                    .frame(height: 200)
                Spacer()
                Color(hue: 0.5, saturation: 0.5, brightness: 0.5)
                    .frame(height: 200)
                Spacer()
                Color(0xFFAD4D)
                    .frame(height: 200)
            }
        }
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double((hex >> 0) & 0xFF) / 255)
    }
}


struct MyHexColor_Previews: PreviewProvider {
    static var previews: some View {
        MyHexColor()
    }
}
