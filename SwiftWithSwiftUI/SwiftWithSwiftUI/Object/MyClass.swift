//
//  MyClass.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/06.
//

import SwiftUI

struct Person {
    var name: String
    let age: Int
}

class PersonClass {
    var name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
struct MyClass: View {
    
//    var person = Person(name: "Hyun", age: 21)
    @State var nickName: String = "None"
    
    var body: some View {
        VStack {
            Text(nickName)
            
            Button {
                var person = PersonClass(name: "Hyun", age: 21)
                var fakePerson = person
                person.name = "Hyun2"
                fakePerson.name = "Hyun3"
                nickName = person.name
            } label: {
                Text("Hit")
            }

        }
    }
}

struct MyClass_Previews: PreviewProvider {
    static var previews: some View {
        MyClass()
    }
}
