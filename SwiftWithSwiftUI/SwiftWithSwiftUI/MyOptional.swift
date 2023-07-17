//
//  MyOptional.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct MyOptional: View {
    
    let name: String
    let age: Int?
    
    // name : String or nil
    
    var body: some View {
        VStack{
            Text(name)
            if let age = age {
                Text(age.description)
            } else {
                Text("nil")
            }
            // nil -> "100"
        }
    }
}

struct MyOptional_Previews: PreviewProvider {
    static var previews: some View {
        MyOptional(name: "hyun", age: nil)
    }
}
