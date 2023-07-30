//
//  ContentView.swift
//  SimpleAccountBook
//
//  Created by CNU on 2023/07/14.
//

import SwiftUI

struct MainScrollView: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(1 ..< 100) { _ in
                    AccountRow()
//                    Text("item \($0)")
//                        .font(.title)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .padding()
        }
        .frame(width: .infinity)
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
}

struct AccountRow: View {
    
    var buttonArea: some View {
        VStack {
            Button {
                
            } label: {
                Text("+")
                    .foregroundColor(.black)
            }
            .frame(width: 43, height: 33)
            .background(.quaternary)
//            .background(Color("AccountAdd"))
            .cornerRadius(10)
        }
        .padding()
    }
    
    var body: some View {
        HStack {
            // 로고
            Text("🐶")
                //.frame(width: 40, height: 40)
                //.background(.secondary)
                .font(.system(size:45))
                .cornerRadius(0.3)
            //Spacer()
            // 타이틀 , 금액
            VStack {
                Text("커피 / 음료수")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("4,500원")
                    .font(.title3)
            }
//            .background(.gray)
            Spacer()
            
            // Button
            buttonArea
        }
    }
}

struct TopArea:View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("Top Button")
            }
        }.padding()
    }
}


struct BottomArea:View {
    var body: some View {
        HStack(){
            Button {
                
            } label: {
                Text("Bottom")
            }
        }
    }
}
struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
                .opacity(0.2)
            VStack {
                // Top Area
                TopArea()
                
                Spacer()
                MainScrollView()
                Spacer()
                
                // Bottom Area
                BottomArea()
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
