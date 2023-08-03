//
//  InformationDetailView.swift
//  SimpleTipApp
//
//  Created by 이현재 on 2023/08/01.
//

import SwiftUI

struct InformationDetailView: View {
    var body: some View {
        List {
            VStack {
                Image(systemName: "person.badge.shield.checkmark.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                Text("사용자 정보 보호하기")
                    .bold()
                    .font(.system(size: 25))
                    .padding(1)
                Text("iPhone이 사용자의 정보를 안전하게 비공개로 보호하는 방법을 알아보세요.")
                    .multilineTextAlignment(.center)
            }
            .padding(.leading, 35)
            .listRowBackground(LinearGradient(colors: [.green, .cyan], startPoint: .bottomLeading, endPoint: .topTrailing)
                .mask {
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: .black, location: 0),
                        .init(color: .clear, location: 1.0),
                    ]), startPoint: .top, endPoint: .bottom)
                })

            NavigationLink {
                InfoExploreView()
            } label: {
                HStack {
                    Image("phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 15)
                        .background(.gray)
                        .cornerRadius(12)
                    VStack(alignment: .leading) {
                        Text("마스크를 쓴 상태로 사용할 수 있는 Face Id 추가하기")
                            .bold()
                            .font(.system(size: 18))
                        Text("iPhone을 응시하여 잠금을 해제하거나 앱 구입 등의 기능을 사용할 수 있습니다. ...")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                }
            }
            NavigationLink {
                Text("사용자의 Apple ID 확인하기 상세")
            } label: {
                HStack {
                    Image("phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 15)
                        .background(.gray)
                        .cornerRadius(12)
                    VStack(alignment: .leading) {
                        Text("사용자의 Apple ID 확인하기")
                            .bold()
                            .font(.system(size: 18))
                        Text("iPhone을 응시하여 잠금을 해제하거나 앱 구입 등의 기능을 사용할 수 있습니다. ...")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                }
            }
            NavigationLink {
                Text("iPhone 백업하기 상세")
            } label: {
                HStack {
                    Image("phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 15)
                        .background(.gray)
                        .cornerRadius(12)
                    VStack(alignment: .leading) {
                        Text("iPhone 백업하기")
                            .bold()
                            .font(.system(size: 18))
                        Text("iPhone을 응시하여 잠금을 해제하거나 앱 구입 등의 기능을 사용할 수 있습니다. ...")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                }
            }
            NavigationLink {
                Text("마스크를 쓴 상태로 사용할 수 있는 Face Id 추가하기 상세")
            } label: {
                HStack {
                    Image("phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 15)
                        .background(.gray)
                        .cornerRadius(12)
                    VStack(alignment: .leading) {
                        Text("마스크를 쓴 상태로 사용할 수 있는 Face Id 추가하기")
                            .bold()
                            .font(.system(size: 18))
                        Text("iPhone을 응시하여 잠금을 해제하거나 앱 구입 등의 기능을 사용할 수 있습니다. ...")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                }
            }
            NavigationLink {
                Text("마스크를 쓴 상태로 사용할 수 있는 Face Id 추가하기 상세")
            } label: {
                HStack {
                    Image("phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 15)
                        .background(.gray)
                        .cornerRadius(12)
                    VStack(alignment: .leading) {
                        Text("마스크를 쓴 상태로 사용할 수 있는 Face Id 추가하기")
                            .bold()
                            .font(.system(size: 18))
                        Text("iPhone을 응시하여 잠금을 해제하거나 앱 구입 등의 기능을 사용할 수 있습니다. ...")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct InformationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InformationDetailView()
    }
}
