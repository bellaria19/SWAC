//
//  ContentView.swift
//  SimpleWeatherApp
//
//  Created by 이현재 on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image(systemName: "cloud")
                    .resizable()
                    //.scaledToFit()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
            .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("포항시")
                        .font(.title)
                    Text("13°")
                        .font(.system(size: 80, weight: .thin))
                    Text("한때 흐림")
                        .font(.title3)
                    HStack {
                        Text("최고: 18°")
                        Text("최저: 11°")
                    }
                    .font(.title)
                }

                BlurStackView {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                } contentView: {
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            VStack {
                                Text("지금")
                                Image(systemName: "cloud.moon")
                                Text("13°")
                            }
                            VStack {
                                Text("오후 10시")
                                Image(systemName: "cloud.moon")
                                Text("13°")
                            }
                            VStack {
                                Text("오후 11시")
                                Image(systemName: "cloud.moon")
                                Text("13°")
                            }
                            VStack {
                                Text("오전 12시")
                                Image(systemName: "moon.stars")
                                Text("13°")
                            }
                        }
                    }
                }
                BlurStackView {
                    HStack {
                        Image(systemName: "calendar")
                        Text("10일간의 일기예보")
                    }
                } contentView: {
                    VStack {
                        HStack {
                            Text("오늘")
                            Image(systemName: "cloud.moon")
                            Text("11°")
                            Text("18°")
                        }
                        Divider()
                        HStack {
                            Text("화")
                            Image(systemName: "sun.min.fill")
                            Text("11°")
                            Text("18°")
                        }
                        Divider()
                        HStack {
                            Text("수")
                            Image(systemName: "sun.min.fill")
                            Text("11°")
                            Text("18°")
                        }
                        Divider()
                        HStack {
                            Text("목")
                            Image(systemName: "cloud")
                            Text("11°")
                            Text("18°")
                        }
                        Divider()
                        HStack {
                            Text("금")
                            Image(systemName: "sun.min.fill")
                            Text("11°")
                            Text("18°")
                        }
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
