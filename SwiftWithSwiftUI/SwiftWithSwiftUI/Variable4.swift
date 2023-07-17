//
//  Variable4.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct Variable4: View {
    
    let names = ["Leeo", "Olivia", "DDu"]
    let engKrDictionary: [String:String] = ["Apple": "사과", "Banana":"바나나", "Coconut": "코코넛"]
    let houseAnimals: Set = ["🐶", "🐱", "🐭"]
    let farmAnimals: Set = ["🐻‍❄️", "🐨", "🦁", "🐯", "🐶", "🐱"]
    
    var body: some View {
        VStack{
            Text(names[0])
            Text(names[1])
            Text(names[2])
            
            Text(engKrDictionary["Apple"]!)
            Text(engKrDictionary["Banana"]!)
            Text(engKrDictionary["Coconut"]!)
            
            Text(houseAnimals.intersection(farmAnimals).description)
            Text(houseAnimals.union(farmAnimals).description)
        }
    }
}

struct Variable4_Previews: PreviewProvider {
    static var previews: some View {
        Variable4()
    }
}
