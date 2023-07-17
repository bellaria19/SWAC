//
//  MyConcurrency.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

struct MyConcurrency: View {
    
    @State var myName = "Leeo"

    var body: some View {
        VStack {
            Text(myName)
                
            Button("Download!") {
                downloadFile()
            }
        }
    }
    
    func downloadFile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            myName = "Done"
        }
    }
}

struct MyConcurrency_Previews: PreviewProvider {
    static var previews: some View {
        MyConcurrency()
    }
}
