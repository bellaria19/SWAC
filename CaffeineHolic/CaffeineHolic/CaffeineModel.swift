//
//  CaffeineModel.swift
//  CaffeineHolic
//
//  Created by CNU on 2023/07/07.
//

import Foundation

enum CaffeineState: String {
    case Intro
    case Wakening
    case Stressful
    case Rest
}

struct dailyItem {
    var state: CaffeineState = .Intro
    var count: Int = 1
}

class CaffeineModel {
    
    var currentState:CaffeineState = CaffeineState.Intro
    var imgFrame: CGSize = CGSize(width: 200, height: 200)

    
    let originList = ["First", "Second"]
    var dailyList: [dailyItem] = []
    
    
    func resetImgSize() {
        imgFrame = CGSize(width: 200, height: 200)
    }
    func incImgSize() {
        var newFrame: CGSize = imgFrame
        newFrame.width += 10
        newFrame.height += 10
        if newFrame.height < 350 {
            imgFrame = newFrame
        }
    }
    
    func getStateImg() -> String {
        return "Profile." + currentState.rawValue
//        switch(currentState) {
//        case .Intro:
//            return "Profile.Intro"
//        case .Wakening:
//            return "Profile.Wakening"
//        case .Stressful:
//            return "Profile.Stressful"
//        case .Rest:
//            return "Profile.Rest"
//        }
    }
    func doReset() -> (Bool, [dailyItem]) {
        if currentState == .Intro {
            return (false, dailyList)
        }
        dailyList.removeAll()
        return changeState(newState: .Intro)
    }
    
    func doWakening() -> (Bool, [dailyItem]) {
//        self.currentState = CaffeineState.Wakening
        return changeState(newState: .Wakening)
    }
    
    func doStress() -> (Bool, [dailyItem]) {
//        self.currentState = CaffeineState.Stressful
        return changeState(newState: .Stressful)
    }
    
    func doRest() -> (Bool, [dailyItem]) {
//        self.currentState = CaffeineState.Rest
        return changeState(newState: .Rest)
    }
    
    private func changeState(newState: CaffeineState) -> (Bool, [dailyItem]) {
        var result: Bool = false
        
        addDailyList(state: newState)
        
        if newState != self.currentState {
            result = true
            self.currentState = newState
            resetImgSize()
        } else {
            incImgSize()
        }
        
        return (result, dailyList)
    }
    
    private func addDailyList(state: CaffeineState) {
        var daily: dailyItem = .init()
        daily.state = state
        daily.count = 1
        
        if dailyList.count == 0 {
            dailyList.insert(daily, at: 0)
        }
        
        var item = dailyList.removeFirst()
        if item.state == state {
            item.count += 1
            dailyList.insert(item, at: 0)
        } else {
            dailyList.insert(item, at: 0)
            dailyList.insert(daily, at: 0)
        }
        
//        switch (state) {
//        case .Stressful:
//            dailyList.insert("Stress Up", at: 0)
//        case .Wakening:
//            dailyList.insert("Get Some Coffee", at: 0)
//        case .Intro:
//            dailyList.insert("New", at: 0)
//        case .Rest:
//            dailyList.insert("REST", at: 0)
//        }
    }
}
