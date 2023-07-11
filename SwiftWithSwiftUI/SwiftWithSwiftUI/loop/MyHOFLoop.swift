//
//  MyHOFLoop.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/10.
//

import SwiftUI

struct MyHOFLoop: View {
    
    @State var friends = ["Leeo Lee", "James Kim", "Jin Park", "Leeo Lee"]
    
    var body: some View {
        VStack {
            List {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                }
                
                Button("Remove space") {
                    friends = friends.map({ friend in
                        friend.replacingOccurrences(of: " ", with: "")
                    }).filter({ friend in
                        friend == "LeeoLee"
                    })
//                    friends = friends.filter({ friend in
//                        friend == "Leeo Lee"
//                    })
//                    friends = filterName(friends, filteredName: "Leeo Lee")
                    //                    friends = removeSpace(friends)
//                    friends = friends.map({ friend in
//                        friend.replacingOccurrences(of: " ", with: "")
//                    })
                }
            }
        }
    }
    
    func filterName(_ names: [String], filteredName:String) -> [String] {
        var names: [String] = []
        
        for item in names {
            if item == filteredName{
                names.append(item)
            }
        }
        return names
    }
    
    func removeSpace(_ names: [String]) -> [String] {
        var tempNames: [String] = []
        
        for item in names {
            tempNames.append(item.replacingOccurrences(of: " ", with: ""))
        }
        
        return tempNames
    }
}

struct MyHOFLoop_Previews: PreviewProvider {
    static var previews: some View {
        MyHOFLoop()
    }
}
