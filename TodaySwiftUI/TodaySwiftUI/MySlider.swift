//
//  MySlider.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MySlider: View {
    
    @State var myPoint: Float = 0
    
    var body: some View {
        VStack {
            Text(myPoint.description)
            Slider(value: $myPoint, in: 0...100, step: 1) {
                Text("1 to 100")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }
            .tint(.blue)
        }
    }
}

struct MySlider_Previews: PreviewProvider {
    static var previews: some View {
        MySlider()
    }
}
