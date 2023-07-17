//
//  MyExtension.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

struct MyExtension: View {
    var body: some View {
        ZStack {
            Color.peach.ignoresSafeArea()
            Text("Hyun")
            
//            Text( "010-1111-2222".checkHaveDash() )
        }
    }
}

//extension ZStack {
//    func sayHyun() {
//        print("Hyun")
//    }
//}

//extension String {
//    func checkHaveDash() {
//
//    }
//}

extension Color {
    static let peach = Color("Peach")
}

//extension MyExtension {
//    func sayMyName() {
//        print("Hyun")
//    }
//}

struct MyExtension_Previews: PreviewProvider {
    static var previews: some View {
        MyExtension()
    }
}
