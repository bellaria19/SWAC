//
//  AccessControlView.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/12.
//

import SwiftUI

class Taxi {
    private var driver: String
    
    init(driver: String) {
        self.driver = driver
    }
    
    func changeDriver(newDriver: String) {
        driver = addDot(name: newDriver)
    }
    
    func getDriver() -> String {
        return driver
    }
    
    private func addDot(name: String) -> String {
        return name + "."
    }
}

struct AccessControlView: View {
    
    var myTaxi = Taxi(driver: "Hyun")
    
    var body: some View {
        VStack {
            Text("배차된 기사님 바구기")
            Button {
                myTaxi.changeDriver(newDriver: "Hyun3")
                print(myTaxi.getDriver())
            } label: {
                Text("Change")
            }
        }
    }
}

struct AccessControlView_Previews: PreviewProvider {
    static var previews: some View {
        AccessControlView()
    }
}
