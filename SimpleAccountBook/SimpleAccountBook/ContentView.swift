//
//  ContentView.swift
//  SimpleAccountBook
//
//  Created by CNU on 2023/07/14.
//

import SwiftUI

func numberFormat(price: String) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    if let intValue = Int(price) {
        let num = NSNumber(value: intValue)
        if let result = numberFormatter.string(from: num) {
            return result
        }
    }
    return price
}

struct MainScrollView: View {
    
    @StateObject var dataManager: AccountDataManager = AccountDataManager.shared
    @State var acCategory: AccountCategory = .none
    
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(Array(dataManager.getList(Category: acCategory).enumerated()), id: \.offset) { idx, data in
                    AccountRow(accountData: data)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .padding()
        
        }
        .background(.white)
        .cornerRadius(20)
        .padding()
        CategorySelectionArea(selectedCategory: $acCategory)
    }
}

struct AccountRow: View {
    
    var accountData: AccountData
    
    var buttonArea: some View {
        VStack {
            Button {
                // edit
            } label: {
                Text("+")
                    .foregroundColor(.black)
            }
            .frame(width: 43, height: 33)
            .background(.quaternary)
//            .background(Color("AccountAdd"))
            .cornerRadius(10)
        }
        .padding()
    }
    
    var body: some View {
        HStack {
            // 로고
            Text(accountData.category.DisplayImoji)
                //.frame(width: 40, height: 40)
                //.background(.secondary)
                .font(.system(size:45))
                .cornerRadius(0.3)
            //Spacer()
            // 타이틀 , 금액
            VStack(alignment: .leading) {
                Text(accountData.title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    
                Text(numberFormat(price: accountData.account) + "원")
                    .font(.title3)
            }
//            .background(.gray)
            Spacer()
            
            // Button
            buttonArea
        }
    }
}

struct TopArea: View {
    
    @State private var isShowModal = false
    
    var body: some View {
        HStack {
            Button {
                self.isShowModal = true
            } label: {
                Text("💸💸💸")
                    .font(.system(size: 33.3))
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .sheet(isPresented: self.$isShowModal) {
                InputAccountModal(isPresented: self.$isShowModal)
            }
        }
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
}


//struct BottomArea:View {
//    var body: some View {
//        HStack(){
//            Button {
//                
//            } label: {
//                Text("Bottom")
//            }
//        }
//    }
//}

struct CategorySelectionArea: View {
    
    @Binding var selectedCategory: AccountCategory
    
    var body: some View {
        VStack {
            Picker("지출 종류를 골라주세요", selection: $selectedCategory) {
                ForEach(AccountCategory.allCases, id: \.self) { category in
                    Text(category.DisplayImoji)
                        .tag(category)
                }
            }
            .onChange(of: selectedCategory, perform: { newValue in
                
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
}
struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
                .opacity(0.2)
            VStack {
                // Top Area
                TopArea()
                
                Spacer()
                MainScrollView()
                Spacer()
                
                // Bottom Area
//                BottomArea()
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
