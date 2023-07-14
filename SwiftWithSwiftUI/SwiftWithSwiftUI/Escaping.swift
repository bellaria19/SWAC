//
//  Escaping.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/13.
//

import SwiftUI

class Boom {
    let power: Int
    var action: () -> ()
        
    func explode(closure: @escaping () -> () ) {
        action = closure
    }
    
    func act() {
        action()
    }
    
    init(power: Int, action: @escaping () -> Void) {
        self.power = power
        self.action = action
    }
}

struct Escaping: View {
    @State var isOn = false
    var body: some View {
        Button {
            let myBoom = Boom(power: 3, action: {  } )
            myBoom.explode {
                print("boom! boom!")
            }
            myBoom.act()
        } label: {
            Text("Boom")
        }

    }
}

struct Escaping_Previews: PreviewProvider {
    static var previews: some View {
        Escaping()
    }
}
