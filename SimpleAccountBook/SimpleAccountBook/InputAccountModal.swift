//
//  InputAccountModal.swift
//  SimpleAccountBook
//
//  Created by 이현재 on 2023/07/30.
//

import SwiftUI

struct InputAccountModal: View {
    
    var dataManager: AccountDataManager = AccountDataManager.shared
    // Using State & Binding Model
    @Binding var isPresented: Bool
    // Using dismiss functions
    @Environment(\.dismiss) private var dismiss
    
    @State private var money: String = ""
    @State private var memo: String = ""
    
    @State private var selectedCategory: AccountCategory = .none
    
    
    
    
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
                    let result = addAccountData()
                    isPresented = result
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
            Text("")
            //Spacer()
            TextField("메모 입력", text: $memo)
                .font(.title)
            Text("")
            
            Picker("지출 종류를 골라주세요", selection: $selectedCategory) {
                ForEach(AccountCategory.allCases, id: \.self) { category in
                    Text(category.DisplayImoji)
                        .tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Text("")
            HStack {
                Text("오늘은")
                Spacer()
            }
            Text(selectedCategory.Display)
                .font(.title)
            Spacer()
        }
        .padding()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TopButton
            InputArea
            Spacer()
        }
        .padding()
    }
    
    func addAccountData() -> Bool {
        let acData = AccountData(category: selectedCategory, title: memo, account: money)
        let result = dataManager.add(AccounData: acData)
        return !result
    }
}
