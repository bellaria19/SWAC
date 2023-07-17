//
//  MyDataModeling.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI


struct MyDataModeling: View {
    
    struct Pet {
        let name: String
        let ownerName: String
        let type: String
        let hasBaby: Bool
    }

    let myPet = Pet(name: "BBiBBi",
                    ownerName: "Leeo",
                    type: "Cat", hasBaby: false)
    let myPet2 = Pet(name: "Dodo",
                     ownerName: "Leeo",
                     type: "Dog", hasBaby: true)
    
    var body: some View {
        VStack {
            List{
                Text("이름 " + myPet.name)
                Text("주인 " + myPet.ownerName)
                Text("종 " + myPet.type)
                Text("아이 " + myPet.hasBaby.description)
            }
            List {
                Text("이름 " + myPet2.name)
                Text("주인 " + myPet2.ownerName)
                Text("종 " + myPet2.type)
                Text("아이 " + myPet2.hasBaby.description)
            }
        }
    }
}

struct MyDataModeling_Previews: PreviewProvider {
    static var previews: some View {
        MyDataModeling()
    }
}
