//
//  ContentView.swift
//  SimpleWeatherApp
//
//  Created by 이현재 on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var offset: CGFloat = 0
    
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
            ScrollView(showsIndicators: false) {
                VStack {
                    if offset >= 50 {
                        Text("포항시")
                            .font(.title)
                        
                    } else {
                        VStack{
                            Text("포항시")
                                .font(.title)
                            HStack {
                                Text("13°")
                                Text("|")
                                Text("한때 흐림")
                            }
                            .font(.title3)
                        }
                        //                            .foregroundColor(.white)
                        
                    }
                    Text("13°")
                        .font(.system(size: 80, weight: .thin))
                        .opacity(setOpacity())
                    Text("한때 흐림")
                        .font(.title3)
                        .opacity(setOpacity())
                    HStack {
                        Text("최고: 18°")
                        Text("최저: 11°")
                    }
                    .font(.title)
                    .opacity(setOpacity())
                }
                .foregroundColor(.white)
                .offset(y: -offset + 70)
                .background(GeometryReader(content: { geo -> Color in
                    let minY = geo.frame(in: .global).minY
                    DispatchQueue.main.async {
                        offset = minY
                    }
                    return Color.clear
                }))
                //                .padding()
                
                BlurStackView {
                    Text("오전 12시쯤 청명한 상태가 예상됩니다.")
                } contentView: {
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            ForecastView(time: "지금", imageName: "cloud.moon", celcius: 13)
                            ForecastView(time: "오후 10시", imageName: "cloud.moon", celcius: 13)
                            ForecastView(time: "오후 11시", imageName: "cloud.moon", celcius: 13)
                            ForecastView(time: "오전 12시", imageName: "moon.stars", celcius: 13)
                        }
                    }
                }
                
                BlurStackView {
                    HStack {
                        Image(systemName: "calendar")
                        Text("10일간의 일기예보")
                    }
                } contentView: {
                    ForEach(dummyData) { dayForecast in
                        VStack {
                            HStack {
                                Text(dayForecast.day)
                                Image(systemName: dayForecast.imageName)
                                Text("\(dayForecast.lowTemperture.description)°")
                                ZStack {
                                    Capsule()
                                        .foregroundColor(.white)
                                    GeometryReader { proxy in
                                        Capsule()
                                            .fill(.linearGradient(Gradient(colors: [.blue, .green]),  startPoint: .leading, endPoint: .trailing))
                                            .frame(width: 100)
                                    }
                                }
                                Text("\(dayForecast.highTemperture.description)°")
                            }
                        }
                    }
                }
//                    VStack {
//                        HStack {
//                            Text("오늘")
//                            Image(systemName: "cloud.moon")
//                            Text("11°")
//                            ZStack {
//                                Capsule()
//                                    .foregroundColor(.white)
//                                GeometryReader { proxy in
//                                    Capsule()
//                                        .fill(.linearGradient(Gradient(colors: [.blue, .green]),  startPoint: .leading, endPoint: .trailing))
//                                        .frame(width: 100)
//                                }
//                            }
//                            Text("18°")
//                        }
//                        Divider()
//                        HStack {
//                            Text("화")
//                            Image(systemName: "sun.min.fill")
//                            Text("11°")
//                            Text("18°")
//                        }
//                        Divider()
//                        HStack {
//                            Text("수")
//                            Image(systemName: "sun.min.fill")
//                            Text("11°")
//                            Text("18°")
//                        }
//                        Divider()
//                        HStack {
//                            Text("목")
//                            Image(systemName: "cloud")
//                            Text("11°")
//                            Text("18°")
//                        }
//                        Divider()
//                        HStack {
//                            Text("금")
//                            Image(systemName: "sun.min.fill")
//                            Text("11°")
//                            Text("18°")
//                        }
//                    }
                
                
                BlurStackView {
                    Text("대기질")
                } contentView: {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("59")
                            Text("-")
                            Text("보통")
                        }
                        Text("현재의 대기질 지수는 59 수준으로, 어제 이 시간과 비슷합니다.")
                    }
                }
                VStack {
                    HStack {
                        BlurStackView {
                            HStack {
                                Image(systemName: "calendar")
                                Text("체감 온도")
                            }
                        } contentView: {
                            VStack(alignment: .leading) {
                                Text("6°")
                                    .font(.title)
                                Spacer()
                                Text("바람으로 인해 더 신선하게 느껴지겠습니다.")
                            }
                        }
                        BlurStackView {
                            HStack {
                                Image(systemName: "calendar")
                                Text("습도")
                            }
                        } contentView: {
                            VStack(alignment: .leading) {
                                Text("70%")
                                    .font(.title)
                                Spacer()
                                Text("현재 이슬점이 2°입니다.")
                            }
                        }
                    }
                }
            }
        }
    }
    
    func setOpacity() -> CGFloat {
        if offset < 70 {
            return offset / 70
        } else {
            return 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
