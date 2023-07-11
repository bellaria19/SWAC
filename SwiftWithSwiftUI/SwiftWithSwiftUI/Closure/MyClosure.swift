//
//  MyClosure.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct MyClosure: View {
    
    let myFirstClosure: () -> Void = { print("Hi closure") }
    
    func sayHi() -> Void{
        print("Hi function")
    }
    
    func sayHi2(action: () -> ()) -> Void {
        print("Hi2 function")
    }
    
    var body: some View {

//        VStack {
//            Button {
//                sayHi2 {
//                    <#code#>
//                }
//            } label: {
//                Text("Button")
//            }

//            Button {
//                sayHi()
//            }label: {
//                Text("Function Button")
//            }
//            Button(action: myFirstClosure) {
//                Text("Closure Button")
//            }
//        }
        
        //        Button(action: myFirstClosure) {
//            Text("HitMe")
//        }
        Text("Test")
    }
}

struct MyClosure_Previews: PreviewProvider {
    static var previews: some View {
        MyClosure()
    }
}
