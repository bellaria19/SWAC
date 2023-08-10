//
//  FeedView.swift
//  SimpleUI
//
//  Created by 이현재 on 2023/08/08.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Today's Monday")
                            .bold()
                        Text("Dec. 22. 2022")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                    }.padding()
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color.blue)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Image(systemName: "bolt")
                            .frame(width: 50, height: 50)
                            .overlay {
                                Circle()
                                    .inset(by: 1)
                                    .strokeBorder(lineWidth: 1)
                            }
                    }
                    .padding()
                }
                
                Spacer()
                
                Text("Team Feed")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("#random")
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .inset(by: 5)
                                    .strokeBorder(lineWidth: 2)
                            }
                        Text("#design")
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .inset(by: 5)
                                    .strokeBorder(lineWidth: 2)
                            }
                        Text("#feedback")
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .inset(by: 5)
                                    .strokeBorder(lineWidth: 2)
                            }
                        Text("#feedback")
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .inset(by: 5)
                                    .strokeBorder(lineWidth: 2)
                            }
                        Text("#feedback")
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .inset(by: 5)
                                    .strokeBorder(lineWidth: 2)
                            }
                    }
                }
                .padding()
                
                Spacer()
                
                //                VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "bolt")
                            .frame(width: 50, height: 50)
                            .overlay {
                                Circle()
                                    .inset(by: 1)
                                    .strokeBorder(lineWidth: 1)
                            }
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
                        .padding()
                    
                    
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200, alignment: .center)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 1)
                                .strokeBorder()
                        }
                        
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("😍")
                            Text("12")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 1)
                                .strokeBorder()
                        }
                        
                        Button {
                            
                        } label: {
                            Text("👍")
                            Text("12")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 1)
                                .strokeBorder()
                        }

                        Button {
                        } label: {
                            Text("🔗")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 1)
                                .strokeBorder()
                        }
                        
                    }
                }
                .padding()
                
                
                VStack {
                    HStack {
                        Image(systemName: "bolt")
                            .frame(width: 50, height: 50)
                            .overlay {
                                Circle()
                                    .inset(by: 1)
                                    .strokeBorder(lineWidth: 1)
                            }
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
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 1)
                                .strokeBorder()
                        }
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("😍")
                            Text("12")
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 1)
                                .strokeBorder()
                        }
                        
                        Button {
                            
                        } label: {
                            Text("👍")
                            Text("12")
                        }
                        
                    }
                }
                .padding()
            }
        }
    }
}
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
