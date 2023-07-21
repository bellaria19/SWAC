//
//  MySpacer.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct Person2: Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
}

struct MySpacer: View {
    var body: some View {
        VStack{
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            Spacer()
            HStack {
                Image(systemName: "heart")
                Spacer()
                Text("Bolt!")
            }
            .padding(.horizontal, 30)
            Spacer()
            
            Button {
                print("Blink!")
            } label: {
                Text("Hit")
            }

        }
    }
}

struct MySpacer_Previews: PreviewProvider {
    static var previews: some View {
        MySpacer()
    }
}
