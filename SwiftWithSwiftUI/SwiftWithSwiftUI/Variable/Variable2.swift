//
//  Variable2.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct Variable2: View {
    
    let name:String  = "Hyun"
    let age: Int = 20 + 1
    let height: Double = 10.5
    let hasJob: Bool = true
    // bool은 description
    var body: some View {
        Text("Hello, \(name), \(age), \(height), \(hasJob.description)")
    }
}

struct Variable2_Previews: PreviewProvider {
    static var previews: some View {
        Variable2()
    }
}
