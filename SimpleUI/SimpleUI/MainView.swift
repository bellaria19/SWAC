//
//  MainView.swift
//  SimpleUI
//
//  Created by 이현재 on 2023/08/01.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    Text("Today's Monday")
                    Text("Dec. 22. 2022")
                }.padding()
                
                Spacer()
                
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Image(systemName: "bolt")
                }
                .padding()
            }
            
            Spacer()
            
            Text("Team Feed")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            ScrollView(.horizontal) {
                HStack {
                    Text("#random")
                    Text("#design")
                    Text("#feedback")
                }
            }
            .padding()
            
            Spacer()
            
            VStack {
                HStack {
                    Image(systemName: "bolt")
                    VStack(alignment: .leading) {
                        Text("Hyunjae Lee")
                        Text("Student")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("1min ago")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
//                .padding()
                
                Text("mention")
                    .font(.callout)
                    .padding(.vertical, 5)
                
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                
                HStack {
                    
                }
            }
        }
    }
}

struct SearchView: View {
    var body: some View {
        Text("")
    }
}

struct MessageView: View {
    var body: some View {
        Text("")
    }
}

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Text("Settings")
                .padding()
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
            
            HStack {
                Image("teammate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                    
                
//                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Hyunjae Lee")
                    Text("Student")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.system(size: 13))
                            .padding()
                            .tint(.white)
                            .frame(width: 100, height: 40)
                            .background(.blue)
                            .cornerRadius(25)
                    }
                }
            }
            List {
                Section {
                    NavigationLink {
                        Text("Personal information detail")
                    } label: {
                        Image(systemName: "person")
                        Text("Personal Information")

                    }
                    NavigationLink {
                        Text("Change Password detail")
                    } label: {
                        Image(systemName: "lock")
                        Text("Change Password")
                    }
                    NavigationLink {
                        Text("Personal information detail")
                    } label: {
                        HStack {
                            Image(systemName: "moon")
                            Text("Theme")
                            Spacer()
                            Text("Light")
                        }
                    }
                }
                Section {
                    NavigationLink {
                        Text("Logout View")
                    } label: {
                        Label("Logout", systemImage: "figure.run")
                    }
                }
            }
        }
    }
}

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
            SettingsView()
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
