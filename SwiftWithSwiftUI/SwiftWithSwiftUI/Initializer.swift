//
//  Initializer.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/13.
//

import SwiftUI

struct MyCustomButton: View {
    var backgroundColor: Color = .red
    var buttonTitle: String
    var action: () -> ()
    
    init(backgroundColor: Color, buttonTitle: String, action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.buttonTitle = buttonTitle
        self.action = action
    }
    var body: some View {
        Button(buttonTitle) {
           action()
        }
        .background(backgroundColor)
    }
}

extension MyCustomButton {
    init(testName: String){
        self.init(backgroundColor: .green, buttonTitle: "") {
            
        }
    }
}

struct Initializer: View {
    var body: some View {
        MyCustomButton(backgroundColor: .green, buttonTitle: "Click Me") {
            print("Hyun!")
        }
//        MyCustomButton(testName: <#T##String#>)
//        MyCustomButton(backgroundColor: <#T##Color#>, buttonTitle: <#T##String#>, action: <#T##() -> Void#>)
    }
}

struct Initializer_Previews: PreviewProvider {
    static var previews: some View {
        Initializer()
    }
}
