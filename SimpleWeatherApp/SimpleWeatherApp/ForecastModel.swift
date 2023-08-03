//
//  ForecastModel.swift
//  SimpleWeatherApp
//
//  Created by 이현재 on 2023/08/03.
//

import Foundation

struct Forecast: Identifiable {
    var id = UUID()
    let day: String
    let lowTemperture: Int
    let highTemperture: Int
    let imageName: String
    let arrange: Int
}

var dummyData = [Forecast(day: "오늘", lowTemperture: 11, highTemperture: 18, imageName: "cloud.sun.fill", arrange: 100),
                 Forecast(day: "화", lowTemperture: 9, highTemperture: 21, imageName: "sun.min.fill", arrange: 100),
                 Forecast(day: "수", lowTemperture: 8, highTemperture: 20, imageName: "sun.min.fill", arrange: 100),
                 Forecast(day: "목", lowTemperture: 7, highTemperture: 18, imageName: "cloud", arrange: 100),
                 Forecast(day: "금", lowTemperture: 6, highTemperture: 14, imageName: "sun.min.fill", arrange: 100)]
