//
//  MyOptionalChaining.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/07.
//

import SwiftUI

struct Student {
    let name: String
    let pet: Pet?
}

struct Pet {
    let name: String
    let age: Int
}

struct MyOptionalChaining: View {
    
    let hyun = Student(name: "H123", pet: Pet(name: "pipi2", age: 2))
    var body: some View {
        VStack {
            Text(hyun.name)
            //Text(hyun.pet!.name)
            // hyun.pet?.name -> optional chanining
//            if let petName = hyun.pet?.name {
//                Text(petName)
//            }
            // 위 세줄이 optional binding
            if let petName = hyun.pet?.name {
                Text(petName)
            }
        }
    }
}

struct MyOptionalChaining_Previews: PreviewProvider {
    static var previews: some View {
        MyOptionalChaining()
    }
}
