//
//  Deinit.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/13.
//

import SwiftUI

//class Task {
//    let name: String
//    let level: String
//
//    init(name: String, level: String) {
//        self.name = name
//        self.level = level
//        print("created!")
//    }
//
//    deinit {
//        print("destroyed!")
//    }
//}

class kStudent {
    let name: String
//    var grade: Grade?
    weak var grade: Grade?
    
    init(name: String, grade: Grade? = nil) {
        print("kStudent creadted")
        self.name = name
        self.grade = grade
    }
    
    deinit {
        print("good bye!")
    }
}

class Grade {
    let title: String
//    var topStudent: kStudent?
    weak var topStudent: kStudent?
    
    init(title: String, topStudent: kStudent? = nil) {
        print("grade creadted")
        self.title = title
        self.topStudent = topStudent
    }
    
    deinit {
        print("good bye grade!")
    }
}

struct Deinit: View {
    
    var body: some View {
        VStack {
            Button {
                var leeo: kStudent? = kStudent(name: "Leeo")
                var math: Grade? = Grade(title: "Math")
                
                print("leeo arc : \(CFGetRetainCount(leeo))")
                print("grade arc : \(CFGetRetainCount(math))")
                
                leeo?.grade = math
                math?.topStudent = leeo
                
                print("leeo arc : \(CFGetRetainCount(leeo))")
                print("grade arc : \(CFGetRetainCount(math))")
                
//                leeo?.grade = nil
//                math?.topStudent = nil
//
//                print("leeo arc : \(CFGetRetainCount(leeo))")
//                print("grade arc : \(CFGetRetainCount(math))")
            } label: {
                Text("Click")
            }
        }
        
        //        VStack{
//            Button {
//                var homework: Task? = Task(name: "homework", level: "hard")
//                print("ARC Count 1: \(CFGetRetainCount(homework))")
//                var homework2 = homework
//                print("ARC Count 1: \(CFGetRetainCount(homework))")
//                print("ARC Count 2: \(CFGetRetainCount(homework2))")
//                var homework3 = homework2
//                homework = nil
//                print("ARC Count 2: \(CFGetRetainCount(homework2))")
//                print("ARC Count 3: \(CFGetRetainCount(homework3))")
//                homework3 = nil
//                print("ARC Count 3: \(CFGetRetainCount(homework3))")
//
//            } label: {
//                Text("Click")
//            }
//        }
    }
}

struct Deinit_Previews: PreviewProvider {
    static var previews: some View {
        Deinit()
    }
}
