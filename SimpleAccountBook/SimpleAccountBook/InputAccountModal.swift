//
//  InputAccountModal.swift
//  SimpleAccountBook
//
//  Created by 이현재 on 2023/07/30.
//

import SwiftUI

struct InputAccountModal: View {
    // Using State & Binding Model
    @Binding var isPresented: Bool
    // Using dismiss functions
    @Environment(\.dismiss) private var dismiss
    
    @State private var money: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TopButton
            InputArea
            Spacer()
        }
        .padding()
    }
    
    var TopButton: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Text("돌아가기")
            }
            Spacer()
        }
        .padding()
    }
    
    var InputArea: some View {
        VStack {
            HStack {
                Text("얼마나 쓰셨나요?")
                    .font(.title)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up")
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Circle())
                }

            }
            
            TextField("금액 입력", text: $money)
                .keyboardType(.decimalPad)
                .font(.title)
            Spacer()
        }
        .padding()
    }
}

struct InputAccountModal_Previews: PreviewProvider {
    static var previews: some View {
        InputAccountModal(isPresented: .constant(true))
    }
}
