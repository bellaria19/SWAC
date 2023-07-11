//
//  Variable.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct Variable: View {
    
    let name = "Hi Hyunjae"
    
    var body: some View {
        VStack{
            Text(name)
            Text(name)
        }
    }
}

struct Variable_Previews: PreviewProvider {
    static var previews: some View {
        Variable()
    }
}
