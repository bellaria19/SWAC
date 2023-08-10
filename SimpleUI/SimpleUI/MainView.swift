//
//  MainView.swift
//  SimpleUI
//
//  Created by 이현재 on 2023/08/01.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "doc.plaintext")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            MessageView()
                .tabItem {
                    Label("Message", systemImage: "ellipsis.message.fill")
                }
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
