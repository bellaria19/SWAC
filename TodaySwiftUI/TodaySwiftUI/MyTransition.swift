//
//  MyTransition.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyTransition: View {
    
    @State var isCardShown: Bool = false
    
    var body: some View {
        VStack {
            if isCardShown {
                
                RoundedRectangle(cornerRadius: CGFloat(24))
                    .frame(height: 300)
                    .foregroundColor(.purple)
                    .transition(.push(from: .leading))
            }
            Button {
                isCardShown.toggle()
            } label: {
                Text("Show magic")
            }

        }
        .animation(.easeIn, value: isCardShown)
    }
}

struct MyTransition_Previews: PreviewProvider {
    static var previews: some View {
        MyTransition()
    }
}
