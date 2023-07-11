//
//  MyStruct.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct UserInfo {
    let name: String
    let age: Int?
    let email: String?
    let job: String?
    let hasPet: Bool
    
    func sayMyName(with name: String) {
        print(name)
    }
}

struct MyStruct: View {
    
    let userInfo: UserInfo
    
    var body: some View {
        VStack{
            
            Text(userInfo.name)
            Text(userInfo.age?.description ?? "100")
            Text(userInfo.email?.description ?? "hi@naver.com")
            Text(userInfo.job?.description ?? "No")
            Text(userInfo.hasPet.description)

            Button {
                userInfo.sayMyName(with: userInfo.name)
            } label: {
                Text("Button")
            }
        }
    }
}

struct MyStruct_Previews: PreviewProvider {
    static var previews: some View {
        let olivia = UserInfo(name: "Olivia", age: 30, email: "asdf@naver.com", job: "voice actor", hasPet: false)
        MyStruct(userInfo: olivia)
    }
}
