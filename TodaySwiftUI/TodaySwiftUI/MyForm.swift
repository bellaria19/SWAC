//
//  MyForm.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyForm: View {
    var body: some View {
        
        Form {
            HStack {
                Image(systemName: "heart")
                Text("Leeo")
            }
            HStack {
                Image(systemName: "heart.fill")
                Text("Dodo")
            }
            HStack {
                Image(systemName: "bolt")
                Text("Olivia")
            }
        }
    }
}

struct MyForm_Previews: PreviewProvider {
    static var previews: some View {
        MyForm()
    }
}
