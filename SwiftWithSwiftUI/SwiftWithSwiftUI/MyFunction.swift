//
//  MyFunction.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct MyFunction: View {
    
    @State var myMind: String = "nothing"
    @State var isChangedMind: Bool = false
    
    func getMind(mind: Bool) -> String {
        if mind {
            return "always open"
        } else {
            return "but closed"
        }
    }
    var body: some View {
        VStack {
            Text(myMind)
            
            Button {
                isChangedMind.toggle()
                myMind = getMind(mind: isChangedMind)
            } label: {
                Text("Change my mind!")
            }
        }
    }
}

struct MyFunction_Previews: PreviewProvider {
    static var previews: some View {
        MyFunction()
    }
}
