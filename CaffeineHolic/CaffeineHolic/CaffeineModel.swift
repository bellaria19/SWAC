//
//  CaffeineModel.swift
//  CaffeineHolic
//
//  Created by CNU on 2023/07/07.
//

import Foundation

class CaffeineModel {
    
    enum CaffeineState: String {
        case Intro
        case Wakening
        case Stressful
        case Rest
    }
    
    var currentState:CaffeineState = CaffeineState.Intro
    var imgFrame: CGSize = CGSize(width: 200, height: 200)
    
    func resetImgSize() {
        imgFrame = CGSize(width: 200, height: 200)
    }
    func incImgSize() {
        var newFrame: CGSize = imgFrame
        newFrame.width += 10
        newFrame.height += 10
        imgFrame = newFrame
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
    
    func doWakening() {
//        self.currentState = CaffeineState.Wakening
        changeState(newState: .Wakening)
    }
    
    func doStress() {
//        self.currentState = CaffeineState.Stressful
        changeState(newState: .Stressful)
    }
    
    func doRest() {
//        self.currentState = CaffeineState.Rest
        changeState(newState: .Rest)
    }
    
    private func changeState(newState: CaffeineState) -> Bool {
        var result: Bool = false
        
        if newState != self.currentState {
            result = true
            self.currentState = newState
            resetImgSize()
        } else {
            incImgSize()
        }
        
        return result
    }
}
