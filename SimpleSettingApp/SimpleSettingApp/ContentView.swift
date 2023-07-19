//
//  ContentView.swift
//  SimpleSettingApp
//
//  Created by 이현재 on 2023/07/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAirplainModeOn: Bool = false
    @State private var isVPNOn: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        profileCell()
                    }
                }
                
                Section {
                    //airPlainToggleCell()
                    
                    toggleCell(imageName: "airplane",
                               iconColor: .orange,
                               cellTitle: "에어플레인 모드",
                               isStateOn: $isAirplainModeOn)
                    
                    textNavigationCell(imageName: "wifi",
                               iconColor: .blue,
                               cellTitle: "Wi-Fi",
                               subTitle: "5G") {
                        Text("Wi-Fi 화면")
                    }
                    // wifiTextCell()
                    
                    textNavigationCell(imageName: "airtag",
                               iconColor: .blue,
                               cellTitle: "Bluetooth",
                               subTitle: "끔") {
                        Text("Bluetooth 화면")
                    }
                                        
                    textNavigationCell(imageName: "antenna.radiowaves.left.and.right",
                               iconColor: .green ,
                               cellTitle: "셀룰러") {
                         Text("셀룰러 화면")
                    }
                    
//                    navigationCell(imageName: "antenna.radiowaves.left.and.right",
//                              iconColor: .green ,
//                              cellTitle: "셀룰러") {
//                        Text("셀룰러 화면")
//                    }
                    
                    
                    toggleCell(imageName: "square",
                               iconColor: .blue,
                               cellTitle: "VPN",
                               isStateOn: $isVPNOn)
                    
                    
                    
                    
                }
                
                
                Section {
                    textNavigationCell(imageName: "hourglass",
                               iconColor: .indigo,
                               cellTitle: "스크린 타임") {
                         Text("스크린 타임 화면")
                    }
//                    navigationCell(imageName: "hourglass",
//                              iconColor: .indigo,
//                              cellTitle: "스크린 타임") {
//                        Text("스크린 타임 화면")
//                    }
                }
                
                Section {
                    textNavigationCell(imageName: "gear",
                              iconColor: .gray,
                              cellTitle: "일반") {
                        Text("일반 화면")
                    }
                    textNavigationCell(imageName: "figure.roll",
                              iconColor: .blue,
                              cellTitle: "손쉬운 사용") {
                        Text("손쉬운 사용 화면")
                    }
                    textNavigationCell(imageName: "hand.raised",
                              iconColor: .blue,
                              cellTitle: "개인 정보 보호") {
                        Text("개인 정보 보호 화면")
                    }
//                    navigationCell(imageName: "gear",
//                              iconColor: .gray,
//                              cellTitle: "일반") {
//                        Text("일반 화면")
//                    }
//                    navigationCell(imageName: "figure.roll",
//                              iconColor: .blue,
//                              cellTitle: "손쉬운 사용") {
//                        Text("손쉬운 사용 화면")
//                    }
//                    navigationCell(imageName: "hand.raised",
//                              iconColor: .blue,
//                              cellTitle: "개인 정보 보호") {
//                        Text("개인 정보 보호 화면")
//                    }
                }
                
                Section {
                    textNavigationCell(imageName: "key.fill",
                              iconColor: .gray,
                              cellTitle: "암호") {
                        Text("암호 화면")
                    }

//                    navigationCell(imageName: "key.fill",
//                              iconColor: .gray,
//                              cellTitle: "암호") {
//                        Text("암호 화면")
//                    }
                }
            }
            .navigationTitle(Text("설정"))
        }
    }
    @ViewBuilder
    private func profileCell() -> some View {
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.all, 10)
                .background(.green)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4) {
                Text("Hyun")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
                Text("Apple ID, iCloud, 미디어 및 구입")
                    .font(.system(size: 12))
            }
            .padding(.leading, 6)
        }
        .padding(.vertical, 10)
    }
    
//    @ViewBuilder
//    private func airPlainToggleCell() -> some View {
//        HStack {
//            Image(systemName: "airplane")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 20, height: 20)
//                .padding(.all, 4)
//                .background(.orange)
//                .foregroundColor(.white)
//                .cornerRadius(4)
//
//            Toggle("에어플레인 모드", isOn: $isAirplainModeOn)
//        }
//    }
//
//    @ViewBuilder
//    private func wifiTextCell() -> some View {
//        HStack {
//            Image(systemName: "wifi")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 20, height: 20)
//                .padding(.all, 4)
//                .background(.blue)
//                .foregroundColor(.white)
//                .cornerRadius(4)
//
//            NavigationLink {
//                Text("Wi-Fi 화면")
//            } label: {
//                HStack {
//                    Text("Wi-Fi")
//                    Spacer()
//                    Text("5G")
//                        .foregroundColor(.gray)
//                }
//            }
//        }
//    }
    
//    enum CellType {
//        case cellName
//    }
//
//    func mainCell(type: CellType) {
//        switch type {
//        case .cellName:
//            navigationCell(imageName: <#T##String#>, iconColor: <#T##Color#>, cellTitle: <#T##String#>, destination: <#T##() -> View#>)
//            textNavigationCell(imageName: <#T##String#>, iconColor: <#T##Color#>, cellTitle: <#T##String#>, destination: <#T##() -> View#>)
//            toggleCell(imageName: <#T##String#>, iconColor: <#T##Color#>, cellTitle: <#T##String#>, isStateOn: <#T##Binding<Bool>#>)
//        }
//    }
 
    @ViewBuilder
    private func iconImage(imageName: String, iconColor: Color) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 3)
            .background(iconColor)
            .foregroundColor(.white)
            .cornerRadius(4)
    }
    
    @ViewBuilder
    private func toggleCell(imageName: String, iconColor: Color, cellTitle: String, isStateOn: Binding<Bool>) -> some View {
        HStack {
//            Image(systemName: imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 20, height: 20)
//                .padding(.all, 3)
//                .background(iconColor)
//                .foregroundColor(.white)
//                .cornerRadius(4)
            iconImage(imageName: imageName, iconColor: iconColor)
            Toggle(cellTitle, isOn: isStateOn)
        }
    }
    
    @ViewBuilder
    private func navigationCell<V: View>(imageName: String, iconColor: Color, cellTitle: String, destination: @escaping () -> V) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
            NavigationLink(cellTitle) {
                destination() // Text("cellTitle 화면")
            }
        }
    }
    
    @ViewBuilder
    private func textNavigationCell<V: View>(imageName: String, iconColor: Color, cellTitle: String, subTitle: String? = nil, destination: @escaping () -> V) -> some View {
        HStack {
            iconImage(imageName: imageName, iconColor: iconColor)
            if let subTitle = subTitle {
                NavigationLink {
                    destination()
                } label: {
                    HStack {
                        Text(cellTitle)
                        Spacer()
                        Text(subTitle)
                            .foregroundColor(.gray)
                    }
                }
            } else {
                NavigationLink(cellTitle) {
                    destination() // Text("cellTitle 화면")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
