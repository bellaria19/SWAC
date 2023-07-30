//
//  MySection.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct MySection: View {
    var body: some View {
        List {
//            Section {
//                HStack {
//                    Image(systemName: "heart")
//                    Text("Leeo")
//                }
//                HStack {
//                    Image(systemName: "heart.fill")
//                    Text("Dodo")
//                }
//                HStack {
//                    Image(systemName: "bolt")
//                    Text("Olivia")
//                }
//            } header: {
//                Text("A Class")
//            } footer: {
//                Text("Footer")
//            }qoqsddd

            Section {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Dodo")
                }
                HStack {
                    Image(systemName: "bolt")
                    Text("Olivia")
                }
                HStack {
                    Image(systemName: "heart")
                    Text("Leeo")
                }
            } header: {
                VStack {
                    HStack {
                        Image(systemName: "bolt")
                        Text("A Class")
                    }
                    HStack {
                        Image(systemName: "bolt")
                        Text("A Class")
                    }
                }
            }
            
            Section {
                HStack {
                    Image(systemName: "bolt")
                    Text("Olivia")
                }
                HStack {
                    Image(systemName: "heart")
                    Text("Leeo")
                }
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Dodo")
                }
            } header: {
                Text("b class")
            }
            
            Section {
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
            } header: {
                Text("C class")
            }
        }
    }
}

struct MySection_Previews: PreviewProvider {
    static var previews: some View {
        MySection()
    }
}
