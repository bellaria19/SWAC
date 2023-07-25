//
//  DiaryModel.swift
//  SimpleDiary
//
//  Created by 이현재 on 2023/07/21.
//

import Foundation

enum DiaryWeatherItem: String, CaseIterable, Codable {
    // 날씨
    case sunny
    case cloudy
    case rain
    case snow
    case wind
    case cold
    case hot
    
    var displayImoji: String {
        switch self {
        case .sunny: return "☀️"
        case .cloudy: return "🌥️"
        case .rain: return "🌧️"
        case .snow: return "🌨️"
        case .wind: return "💨"
        case .cold: return "❄️"
        case .hot: return "🔥"
        }
    }
}

enum DiaryFeelingItem: CaseIterable, Codable {
    // 기분
    case happy
    case delight
    case excied
    case sad
    case moodiness
    case annoying
    case angry
    case soso
}

enum DiaryStateItem:Int, CaseIterable, Codable {
    case verygood   = 5
    case good       = 4
    case soso       = 3
    case bad        = 2
    case verybad    = 1
}

struct DiaryModel: Codable {
    // id, 최초 작성 시 사용
    var keyDate: Date
    
    func keyDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: keyDate)
    }
    
    var lastModifiedDate: Date?
    
    // 일기 및 일기 내용
    var title: String
    var contents: String?
    
    // 사용자 id 및 교환 일기 상대 id
    var userId: UUID?
    var partnerId: UUID?
    
    // 날씨
    var weather: DiaryWeatherItem?
    var feeling: DiaryFeelingItem?
    var state: DiaryStateItem?
    
    // 초기화
//    init(keyData: Date, lastModifiedDate: Date? = nil, title: String, contents: String? = nil, userId: UUID? = nil, partnerId: UUID? = nil, weather: DiaryWeatherItem? = nil, feeling: DiaryFeelingItem? = nil) {
//        self.keyData = keyData
//        self.lastModifiedDate = lastModifiedDate
//        self.title = title
//        self.contents = contents
//        self.userId = userId
//        self.partnerId = partnerId
//        self.weather = weather
//        self.feeling = feeling
//    }
    
}

