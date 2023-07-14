//
//  TypeCasting.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/13.
//

import SwiftUI

class Cloth {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    func sayName() {
        print(name)
    }
}

class Shirt: Cloth {
    let size: Int
    init(size: Int, name: String) {
        self.size = size
        super.init(name: name)
    }
    func sayHyun() {
        print("Hyun")
    }
}
struct TypeCasting: View {
    var body: some View {
        Button {
            let myCloth = Cloth(name: "드레스")
            let myShirt = Shirt(size: 95, name: "셔츠")
            // Cloth -> Shirt DownCasting
            // Not always
            let myClothToShirt = myCloth as! Shirt
            // Shirt -> Cloth UpCasting
            // always Succeed
            let myShirtToCloth = myShirt as Cloth
            
            myClothToShirt.sayHyun()
            myShirtToCloth.sayName()
            
        } label: {
            Text("Change")
        }

    }
}

struct TypeCasting_Previews: PreviewProvider {
    static var previews: some View {
        TypeCasting()
    }
}
