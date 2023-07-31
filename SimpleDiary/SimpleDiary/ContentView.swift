//
//  ContentView.swift
//  SimpleDiary
//
//  Created by 이현재 on 2023/07/21.
//

import SwiftUI

struct TopArea: View {
    
    @State private var isShowModal = false
    
    var body: some View {
        HStack {
            Button {
                self.isShowModal = true
            } label: {
                Text("한줄 일기 기록")
                    .font(.system(size: 33))
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .sheet(isPresented: $isShowModal) {
                DiaryInputModal(isPresented: self.$isShowModal)
            }
        }
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
}

struct ContentsArea: View {
    
    @StateObject var dataManger: DiaryDataManager = DiaryDataManager.shared
    
    var body: some View {
        ScrollView() {
            VStack(spacing: 20) {
                ForEach(Array(dataManger.getList().enumerated()), id: \.offset) { idx, data in
                    DiaryListRow(diary: data)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .padding()
        }
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
}

struct DiaryListRow: View {
    
    var diary: DiaryModel
    
    var body: some View {
        NavigationLink(destination: DiaryDetailView(diary: diary)) {
            HStack {
                // 로고
                Text("🐶")
                    .font(.system(size:45))
                    .cornerRadius(0.3)
                //Spacer()
                // 타이틀 , 금액
                VStack(alignment: .leading) {
                    Text(diary.keyDateString())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(diary.title)
                        .font(.title3)
                }
                Spacer()
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
                .opacity(0.2)
            VStack {
                // Area1 topbutton
                TopArea()
                // Area2 Scrollarea
                ContentsArea()
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
