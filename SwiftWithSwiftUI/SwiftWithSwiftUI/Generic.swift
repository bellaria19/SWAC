//
//  Generic.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/13.
//

import SwiftUI

struct Generic: View {
    
    @State var total: String = ""
    
    var body: some View {
        VStack {
            Text(total)
            Button {
                var number1 = "hello"
                var number2 = "hi"
                swap(number1, number2)
            } label: {
                Text("Calculate")
            }
        }
    }
    
    private func swap<T>(_ first: T, _ second: T) {
        print(first, second)
        
        let temp: T
        var fst = first
        var snd = second
        temp = fst
        fst = snd
        snd = temp
        
        print(fst, snd)
    }
    
//    private func doubleCalculate(_ first: Double, _ second: Double) -> Double {
//        return first + second
//    }
}

struct Generic_Previews: PreviewProvider {
    static var previews: some View {
        Generic()
    }
}
