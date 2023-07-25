//
//  MyModal.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyModal: View {
    
    @State var isShowingModal: Bool = false
    
    var body: some View {
        Button {
            isShowingModal.toggle()
        } label: {
            Text("Call modal")
        }
        .fullScreenCover(isPresented: $isShowingModal) {
//            <#code#>
//        })
//        .sheet(isPresented: $isShowingModal) {
            ZStack {
                Color.orange.ignoresSafeArea()
                VStack {
                    Text("Modal View")
                    Button {
                        isShowingModal = false
                    } label: {
                        Text("dismiss")
                    }
                }

            }
        }

    }
}

struct MyModal_Previews: PreviewProvider {
    static var previews: some View {
        MyModal()
    }
}
