//
//  MyTextField.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyTextField: View {
    
    @State var userID: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("ID")
            TextField("Enter Your ID", text: $userID)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct MyTextField_Previews: PreviewProvider {
    static var previews: some View {
        MyTextField()
    }
}
