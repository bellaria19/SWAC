//
//  ContentView.swift
//  SimpleUI
//
//  Created by 이현재 on 2023/08/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("teammate")
                .resizable()
                .scaledToFit()

            Text("Make strong \nrelationshiop with \nyour team")
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 10)
            Text("We help you to connect with your team and make a \nstrong banding with your teammate")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            HStack {
                Button {
                    
                } label: {
                    Text("Register")
                        .padding()
//                        .tint(.white)
                                            .foregroundColor(.white)
                        .frame(width: 170, height: 60)
                        .background(.mint)
                        .cornerRadius(35)
                    
                }

                Spacer()
                
                Button {
                } label: {
                    Text("Login")
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 170, height: 60)
//                        .tint(.white)
                        .background(.blue)
                        .cornerRadius(35)
                        
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
