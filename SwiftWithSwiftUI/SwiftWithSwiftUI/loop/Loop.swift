//
//  Loop.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct Loop: View {
    
    let farmAnimals = ["🐻‍❄️", "🐨", "🦁", "🐯", "🐶", "🐱"]

    var body: some View {
        VStack{
            ForEach(farmAnimals,
                        id: \.self) {animal in
                    Text(animal)
            }
            Spacer()
            
            ForEach(0 ..< 3) { number in
                Text(farmAnimals[number])
            }
        }
    }
}

struct Loop_Previews: PreviewProvider {
    static var previews: some View {
        Loop()
    }
}
