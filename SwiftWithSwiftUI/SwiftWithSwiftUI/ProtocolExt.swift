//
//  ProtocolExt.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/13.
//

import SwiftUI

protocol Coin: Hashable {
    var name: String { get }
    var value: Int { get set }
    
    func makeSound()
}

struct Won: Coin {
    func makeSound() {
        print("쨍그랑")
    }
    var name: String
    var value: Int
}

struct Yen: Coin {
    func makeSound() {
     
    }
    var name: String
    var value: Int
}

struct Dollar: Coin {
    var name: String
    var value: Int
    func makeSound() {
        print("ting!")
    }
}

struct ProtocolExt: View {
    
    let wallet: [any Coin] = [Won(name: "원", value: 300),
                          Won(name: "원", value: 500),
                          Yen(name: "엔", value: 100), Dollar(name: "달러", value: 3)]
    
    var body: some View {
        VStack {
            ForEach(wallet, id: \.hashValue) { item in
                HStack {
                    Text("\(item.value) \(item.name)")
                    Button(action: { item.makeSound() }) {
                        Text("떨구기")
                    }
                }
            }
        }
    }
}

struct ProtocolExt_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolExt()
    }
}
