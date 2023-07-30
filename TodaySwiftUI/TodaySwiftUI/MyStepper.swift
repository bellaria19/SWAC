//
//  MyStepper.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct StepperView: View {
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue,
                           .green, .purple, .pink]
    
    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }
    
    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }
    
    var body: some View {
        Stepper {
            Text("Value: \(value) Color: \(colors[value].description)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
        .colorMultiply(colors[value])
    }
}
    
struct MyStepper: View {
    
    @State var myLevel: Int = 1
    
    var body: some View {
        Stepper(value: $myLevel, in: 1...100) {
            Text("Level \(myLevel)")
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .foregroundColor(.red)
        .background(.blue)
    }
}

struct MyStepper_Previews: PreviewProvider {
    static var previews: some View {
        //MyStepper()
        StepperView()
    }
}
