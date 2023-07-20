//
//  DetailView.swift
//  cnu03
//
//  Created by 이현재 on 2023/07/19.
//

import SwiftUI

struct DetailView: View {
    
    @State var name: String
    @Binding var count: Int
    @State var count2: Int = 0
    
    var body: some View {
        VStack {
            Stepper(value: $count, in: 0...5) {
                Text("갯수: \(count)")
            }
            Stepper(value: $count2, in: 0...5) {
                Text("갯수: \(count2)")
            }
            Text("내 이름은 \(name)입니다.")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name: "테스트", count: .constant(3))
    }
}
