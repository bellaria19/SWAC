//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLightning: Bool = false
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Image(systemName: isLightning ?  "bolt.fill" : "bolt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Spacer()
                
                HStack {
                    Text("번개를 원하시면")
                    
                    Button {
                        isLightning.toggle()
                    } label: {
                        Text("번쩍")
                            .padding()
                            .background(.white)
                            .cornerRadius(20)
                    }

                }
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
