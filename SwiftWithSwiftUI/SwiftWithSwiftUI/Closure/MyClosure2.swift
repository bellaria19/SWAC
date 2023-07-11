//
//  MyClosure2.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

struct MyClosure2: View {
    
    @State var myName: String = "not yet"
    
    var mycustomClosure: (String, String) -> String = { prefix, name in
        return prefix + name + "3"
     }
    
    var body: some View {
        VStack {
            Text(myName)
            Button {
                myName = createName(prefix: "1", name: "2")
//                myName = createName(prefix: "Cool ", name: "Hyun")
            } label: {
                Text("Hit me")
            }

        }
    }
    
    func createName(prefix: String, name: String) -> String {
        return mycustomClosure("Cool", "Hyun2")
//        return prefix + name
    }
}

struct MyClosure2_Previews: PreviewProvider {
    static var previews: some View {
        MyClosure2()
    }
}
