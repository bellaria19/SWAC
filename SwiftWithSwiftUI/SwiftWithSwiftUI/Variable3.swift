//
//  Variable3.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct Variable3: View {
    
    let name = "Hyun"
    let age = 21
    var anyNumber = 5
    var anyNumber2 = 8
    var anyNumber3 = 7
    
    var body: some View {
        VStack {
            Text("\(age + anyNumber)")
            Text("\(age - anyNumber)")
            Text("\(age * anyNumber)")
            Text("\(age / anyNumber)")
            Text("\(age % anyNumber)")
            
            Text("\(anyNumber < anyNumber2)".description)
            Text("\(anyNumber > anyNumber2)".description)
            Text("\(anyNumber < anyNumber3)".description)
            Text("\(anyNumber > anyNumber3)".description)
            Text("\(anyNumber == anyNumber2)".description)
        }
    }
}

struct Variable3_Previews: PreviewProvider {
    static var previews: some View {
        Variable3()
    }
}
