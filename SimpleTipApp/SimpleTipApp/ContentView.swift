//
//  ContentView.swift
//  SimpleTipApp
//
//  Created by 이현재 on 2023/08/01.
//

import SwiftUI

struct Collection: Identifiable {
    var id = UUID()
    let symbolName: String
    let symbolColor: [Color]
    let title: String
}

struct ContentView: View {
    
    @State var searchText: String = ""
    var sList: [Collection] = [Collection(symbolName: "lock.shield",
                                                symbolColor: [.cyan, .green],
                                                title: "사용자 정보 보호하기"),
                                     Collection(symbolName: "lifepreserver",
                                                symbolColor: [.orange, .yellow],
                                                title: "대비하기"),
                                     Collection(symbolName: "star",
                                                symbolColor: [.red, .orange],
                                                title: "필수 항목 설정하기"),
                                     Collection(symbolName: "heart",
                                                symbolColor: [.purple, .pink],
                                                title: "iPhone 개인 맞춤화하기")]
    var moreList: [Collection] = [Collection(symbolName: "moon.stars",
                                             symbolColor: [.cyan, .green],
                                             title: "iOS 16의 새로운 기능"),
                                  Collection(symbolName: "heart.square",
                                             symbolColor: [.cyan, .green],
                                             title: "건강"),
                                  Collection(symbolName: "infinity.circle",
                                             symbolColor: [.cyan, .green],
                                             title: "Siri")]
    var body: some View {
        NavigationStack {
            List {
                ZStack {
                    Image("main")
                        .frame(height: 200)
                        .scaledToFit()
                    Text("iPhone 탐색하기")
                        .bold()
                        .offset(x: -90, y: -90)
                        .font(.system(size: 23))
                }
                Section {
                    ForEach(sList) { item in
                        NavigationLink {
                            InformationDetailView()
                        } label: {
                            Image(systemName: item.symbolName)
                                .resizable()
                                .foregroundStyle(.linearGradient(Gradient(colors: item.symbolColor), startPoint: .leading, endPoint: .trailing))
                                .foregroundColor(.green)
                                .scaledToFit()
                                .frame(width: 20)
                            Text(item.title)
                        }
                        
                    }
                } header: {
                    Text("시작하기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)

                }
                
                Section {
                    ForEach(moreList) { item in
                        NavigationLink {
                            InformationDetailView()
                        } label: {
                            Image(systemName: item.symbolName)
                                .resizable()
                                .foregroundStyle(.linearGradient(Gradient(colors: item.symbolColor), startPoint: .leading, endPoint: .trailing))
                                .foregroundColor(.green)
                                .scaledToFit()
                                .frame(width: 20)
                            Text(item.title)
                        }
                        
                    }
                } header: {
                    Text("더 찾아보기")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                Section {
                    NavigationLink {
                        Text("상세 ")
                    } label: {
                        Label("사진", systemImage: "photo.on.rectangle.angled")
                    }
                    NavigationLink {
                        Text("상세 ")
                    } label: {
                        Label("카메라", systemImage: "camera")
                    }
                } header: {
                    Text("사진 및 카메라")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                Section {
                    NavigationLink {
                        Text("상세 ")
                    } label: {
                        Label("AirPods", systemImage: "airpods.gen3")
                    }
                } header: {
                    Text("모든 기기")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                Section {
                    NavigationLink {
                        Text("상세 ")
                    } label: {
                        Label("iPhone", systemImage: "menucard")
                    }
                    NavigationLink {
                        Text("상세 ")
                    } label: {
                        Label("AirPods", systemImage: "menucard")
                    }
                } header: {
                    Text("사용 설명서")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "검색")
            .navigationTitle("모음")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
