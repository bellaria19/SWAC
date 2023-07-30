//
//  MyExtract.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyExtract: View {
    
    @State var userID: String = ""
    @State var userPassword: String = ""
    @State var hasLoggedIn: Bool = false
    @State var hasShownPassword: Bool = false
    var body: some View {
        VStack {
            HStack {
                Label("ID: ", systemImage: "person.fill")
                TextField("enter ID", text: $userID)
            }
            Divider()
            HStack {
                passLabel()
                if hasShownPassword {
                    TextField("enter password", text: $userPassword)
                } else {
                    SecureField("enter password", text: $userPassword)
                }
                Spacer()
                Toggle(isOn: $hasShownPassword) {
                    
                }
            }
            
            signInButton
            .sheet(isPresented: $hasLoggedIn) {
                Text("Hello Hyun!")
            }
            .padding()
            
        }
    }
    
    @ViewBuilder
    func passLabel() -> some View {
        Label("PW: ", systemImage: "lock.fill")
    }
    
    private func checkLogIn(id: String, pass: String) -> Bool {
        if userID == "Hyun" && userPassword == "1234" {
            return true
        } else {
            return false
        }
    }
    var signInButton: some View {
        Button {
            hasLoggedIn = checkLogIn(id: userID, pass: userPassword)
        } label: {
            Text("Sign in")
                .padding()
                .background(.secondary)
        }
    }
}

struct MyExtract_Previews: PreviewProvider {
    static var previews: some View {
        MyExtract()
    }
}
