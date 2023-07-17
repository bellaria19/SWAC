//
//  MyHOF.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

//func sayMyName () {
//let sayMyName = {
//    print("Hyun")
//}
//
//func introduceMySelf(fst: () -> ()) {
//    fst()
//}
//
//introduceMySelf(fst: sayMyName)

struct MyHOF: View {
    
    let friends = ["Leeo", "Olivia", "Domi", "Ho"]
    let ages = [13, 32, 11, 39]
    
    var body: some View {
        List{
//            ForEach(ages.map({ item in
//                String(item) + " - Kor2"
//            }), id: \.self) { friend in
//                Text(friend + " - Kor")
//            }
//            ForEach(ages.filter({ item in
//                item % 3 != 0
//            }).map({ item in
//                String(item)
//            }), id: \.self) { friend in
//                Text(friend)
//            }
            Text(ages.reduce(0, { partialResult, next in
                partialResult + next
            }).description)
        }
    }
}

struct MyHOF_Previews: PreviewProvider {
    static var previews: some View {
        MyHOF()
    }
}
