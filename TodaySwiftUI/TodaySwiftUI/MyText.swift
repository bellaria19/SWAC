//
//  MyText.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct MyText: View {
    var body: some View {
        VStack {
            Text("Hello Hyun")
                .bold()
                .italic()
                .strikethrough()
            Text("Hello Hyun")
                .font(.system(size: 30))
            Text("Hello Hyun")
                .underline(color: .blue)
                .foregroundColor(.red)
                .background(.green)
            Text("Hello Hyun")
                .foregroundColor(.green)
                .font(.system(size: 40, weight: .bold, design: .monospaced))
        }
    }
}

struct MyText_Previews: PreviewProvider {
    static var previews: some View {
        MyText()
    }
}
