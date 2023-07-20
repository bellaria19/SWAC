//
//  MyList.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
}

struct MyList: View {
    
    let people: [Person] = [Person(name: "Leeo", imageName: "heart"),
                            Person(name: "Dodo", imageName: "heart.fill"),
                            Person(name: "Olivia", imageName: "bolt")]
    
    var body: some View {
//        List(names, id: \.self) { name in
//            Text(name)
//        }
        List(people) { person in
            HStack {
                Image(systemName: person.imageName)
                Text(person.name)
            }
        }
//        List {
//            HStack {
//                Image(systemName: "heart")
//                Text("Leeo")
//            }
//            HStack {
//                Image(systemName: "heart.fill")
//                Text("Dodo")
//            }
//            HStack {
//                Image(systemName: "bolt")
//                Text("Olivia")
//            }
//        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
