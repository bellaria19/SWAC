//
//  Condition.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct Condition: View {
    
    var randomNumber: Int = 4
    
    var body: some View {
        if randomNumber % 2 == 0 {
            Text("짝수")
        } else {
            Text("홀수")
        }
    
    }
}

struct Condition_Previews: PreviewProvider {
    static var previews: some View {
        Condition()
    }
}
