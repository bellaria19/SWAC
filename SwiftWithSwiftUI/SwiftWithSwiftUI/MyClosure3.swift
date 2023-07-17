//
//  MyClosure3.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

struct MyClosure3: View {
    
    @State var result: String = "not yet"
    
    var body: some View {
        VStack {
            Button {
                result = calculateNumber(13, 4, calculate: { first, second in
                    return first * second
                })
            } label: {
                Text("Calculate")
            }
            Text(result)
        }
    }
    
    func calculateNumber(_ first: Int, _ second: Int, calculate: (Int, Int) -> Int) -> String {
        return String(calculate(first, second))
    }
//    func sumTwoNumber(_ first: Int, _ second: Int) -> String {
//        return String(first + second)
//    }
//
//    func subTwoNumber(_ first: Int, _ second: Int) -> String {
//        return String(first - second)
//    }
//
//    func mulTwoNumber(_ first: Int, _ second: Int) -> String {
//        return String(first * second)
//    }
}

struct MyClosure3_Previews: PreviewProvider {
    static var previews: some View {
        MyClosure3()
    }
}
