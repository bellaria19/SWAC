//
//  MySecureField.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MySecureField: View {
    
    @State var userID: String = ""
    @State var password: String = ""
    @State var isSecureMode: Bool = true

    var body: some View {
        VStack {
            Text("ID")
            TextField("Enter your ID", text: $userID)
                .textFieldStyle(.roundedBorder)
            
            
            Text("password")
            if isSecureMode {
                SecureField("Enter your pswd", text: $password)
                    .textFieldStyle(.roundedBorder)
            } else {
                TextField("Enter your pswd", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            Button {
                isSecureMode.toggle()
            } label: {
                Text("Change")
            }

        }
    }
}

struct MySecureField_Previews: PreviewProvider {
    static var previews: some View {
        MySecureField()
    }
}
