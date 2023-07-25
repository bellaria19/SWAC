//
//  MyAlert.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/24.
//

import SwiftUI

struct MyAlert: View {
    
    @State var isShowingAlert: Bool = false
    
    var body: some View {
        Button {
            isShowingAlert = true
        } label: {
            Text("show alert")
        }
        .alert(isPresented: $isShowingAlert) {
//            Alert(title: Text("alert"), message: Text("This is message"), dismissButton: .cancel())
            Alert(title: Text("This is text"),
                  primaryButton: .default(Text("OKS")),
                  secondaryButton: .default(Text("OKP ")))
        }

    }
}

struct MyAlert_Previews: PreviewProvider {
    static var previews: some View {
        MyAlert()
    }
}
