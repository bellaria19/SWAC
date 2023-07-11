//
//  MyClosure4.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

struct MyClosure4: View {
    
    
    
    var body: some View {
        
        
        Text("Hyun")
            .onAppear {
                testTrailingClosure(first: 3, second: 4) { a, b in
                    print("\(a) and \(b)")
                }
            }
    }
    
    func testTrailingClosure(first: Int, second: Int, action: (Int, Int) -> ()) {
        action(first, second)
    }
}

struct MyClosure4_Previews: PreviewProvider {
    static var previews: some View {
        MyClosure4()
    }
}
