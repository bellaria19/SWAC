//
//  CheckPoint.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/07.
//

import SwiftUI

struct Friend {
    let name: String
    let pet: MyPet?
}

enum MyPet {
    case cat(String)
    case dog(String)
}

struct CheckPoint: View {
    var pepe: Friend = Friend(name: "pepe", pet: MyPet.dog("coco"))
    var mimi: Friend = Friend(name: "mimi", pet: MyPet.cat("titi2"))
    @State var pet: String = "제 절친의 애완동물은"
                
    var body: some View {
        VStack{
            Text(pet)
            Button {
                if let petName = mimi.pet {
                    pet = getPetName(petName)
                } else {
                    pet = "애완동물이 없습니다."
                }
                
//                pet = mimi.pet ??  "애완동물이 없습니다"
            } label: {
                Text("Push")
            }

        }
    }
    
    func getPetName(_ petName: MyPet) -> String {
        switch petName {
        case .dog(let nickName):
            return nickName
        case .cat(let nickName):
            return nickName
        }
    }
}

struct CheckPoint_Previews: PreviewProvider {
    static var previews: some View {
        CheckPoint()
    }
}
