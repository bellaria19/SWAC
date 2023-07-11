//
//  MyProtocol.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

protocol Vehicle {
    var name: String { get }
    var speed: Int { get }
}

struct MyProtocol: View {
    
    struct Car: Vehicle {
        let name: String
        let speed: Int
    }
    
    struct Train: Vehicle {
        let name: String
        let speed: Int
    }
    
    struct AirPlain: Vehicle {
        let name: String
        let speed: Int
    }
    
    let car = Car(name: "Power", speed: 3)
    let train = Train(name: "Popo", speed: 5)
    
    let vehicles: [Vehicle] = [Car(name: "Power", speed: 3), Train(name: "Popo", speed: 5), AirPlain(name: "BaBa", speed: 40)]
    
    var body: some View {
        VStack {
            HStack {
//                ForEach(vehicles, id: \.self) { item in
//                    Text(item.name)
//                    Text(item.speed.description)
//                }
                Text(vehicles[0].name)
                Text(vehicles[0].speed.description)
                
            }
            HStack {
                Text(train.name)
                Text(train.speed.description)
            }
        }
    }
}

struct MyProtocol_Previews: PreviewProvider {
    static var previews: some View {
        MyProtocol()
    }
}
