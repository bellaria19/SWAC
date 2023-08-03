//
//  InfoExploreView.swift
//  SimpleTipApp
//
//  Created by 이현재 on 2023/08/01.
//

import SwiftUI

struct InfoExploreView: View {
    
    var body: some View {
        ScrollView {
            HStack {
                TabView {
                    VStack {
                        Image("phone")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 600)
                            .border(.red)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("제목입니다")
                                    .bold()
                                    .font(.system(size: 25))
                                    .padding(.bottom, 3)
                                Text("내용입니다. 잘 부탁드립니다.")
                            }
                            .padding(.horizontal, 30)
                            Spacer()
                        }
                    }
                    VStack {
                        Image("1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 600)
                            .border(.red)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("제목입니다")
                                    .bold()
                                    .font(.system(size: 25))
                                    .padding(.bottom, 3)
                                Text("내용입니다. 잘 부탁드립니다.")
                            }
                            .padding(.horizontal, 30)
                            Spacer()
                        }
                    }
                    VStack {
                        Image("2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 600)
                            .border(.red)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("제목입니다")
                                    .bold()
                                    .font(.system(size: 25))
                                    .padding(.bottom, 3)
                                Text("내용입니다. 잘 부탁드립니다.")
                            }
                            .padding(.horizontal, 30)
                            Spacer()
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
                .tabViewStyle(.page(indexDisplayMode: .always))
            }
        }
        .navigationTitle("탐색하기")
        .toolbar {
            Button {
                
            } label: {
                Image(systemName: "bookmark")
            }
        }
    }
}

struct PageControl: View {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(index == self.currentPage ? .white : .gray)
                    .onTapGesture {
                        self.currentPage = index
                    }
            }
        }
    }
}

struct InfoExploreView_Previews: PreviewProvider {
    static var previews: some View {
        InfoExploreView()
    }
}
