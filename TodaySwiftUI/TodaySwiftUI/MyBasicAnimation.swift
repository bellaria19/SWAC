//
//  MyBasicAnimation.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyBasicAnimation: View {
    
    @State var isClick: Bool = false
    var body: some View {
        VStack {
            Image(systemName: "cloud")
                .offset(y: -200)
            HStack {
                Image(systemName: "bolt")
                    .rotationEffect(isClick ? .degrees(0) : .degrees(180))
                    .offset(y: isClick ? 0 : -200)
                    .padding()
                    .animation(.linear, value: isClick)
                Image(systemName: "bolt")
                    .offset(y: isClick ? 0 : -200)
                    .padding()
                    .animation(.spring(), value: isClick)
                Image(systemName: "bolt")
                    .offset(y: isClick ? 0 : -200)
                    .padding()
                    .animation(.interactiveSpring(), value: isClick)
            
            }
            Button {
                isClick.toggle()
            } label: {
                Text("Click")
            }
        }
    }
}

struct MyBasicAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicAnimation()
    }
}
