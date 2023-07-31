//
//  DiaryDetailView.swift
//  SimpleDiary
//
//  Created by 이현재 on 2023/07/21.
//

import SwiftUI

struct DiaryDetailView: View {
    
    @State var diary: DiaryModel
    @State var isEditMode: Bool = false
    @State var contents: String = ""

    func getImageName() -> String {
        if let weather = diary.weather {
            return "weather." + weather.rawValue
        }
        return "weather.cloudy"
    }
    
    var weatherImage: some View {
        GeometryReader { _ in
            Image(getImageName())
                .resizable()
                .scaledToFill()
                .clipped()
        }
    }
    
    var body: some View {
        ZStack {
            weatherImage
            
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Spacer()
                    diaryContents
                        .frame(height: geo.size.height * 0.67)
                }
            }
            
            VStack {
                Spacer()
                bottomButtons
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    var bottomButtons: some View {
        HStack {
            Spacer()
            Button {
                if let content = diary.contents {
                    self.contents = content
                }
                modechange()
            } label: {
                Label("취소", systemImage: "trash")
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
            }
            Button {
                diary.contents = self.contents
                self.isEditMode = !DiaryDataManager.shared.saveDiary(Diary: self.diary)
                self.contents = ""
            } label: {
                Label("수정완료", systemImage: "pencil.circle")
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
            }
        }
        .opacity(1)
//        .opacity(isEditMode ? 1 : 0)
        .padding()
    }
    
    var diaryTitle: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(diary.title)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
    
    func getStateList() -> Array<String> {
        if let state = diary.state {
            return Array(repeating: "star.fill", count: state.rawValue)
        }
        return Array()
    }
    
    var diaryHead: some View {
        HStack {
            Text(diary.keyDateString())
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            
            Spacer()
            
            HStack(spacing: 0) {
                ForEach(getStateList(), id: \.self) { imageName in
                    Image(systemName: imageName)
                        .imageScale(.large)
                        .foregroundColor(.red)
                }
            }
        }
    }
    func getDiaryContents() -> String {
        var text = "일기 내용입니다"
        if let contents = diary.contents {
            text = contents
        }
        return text
    }

    var diaryDescription: some View {
        ScrollView {
            if isEditMode == false {
                Text(getDiaryContents())
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                TextField("일기내용", text: $contents, axis: .vertical)
            }
        }
    }
    
    func modechange() {
        if let content = diary.contents {
            self.contents = content
        }
        self.isEditMode.toggle()
    }
    
    var diaryContents: some View {
        GeometryReader {
            VStack(alignment: .leading) {
                diaryHead
                diaryTitle
                Text("")
                diaryDescription
                Spacer()
            }
                .frame(height: $0.size.height + 10)
                .padding(32)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
        .onTapGesture(count: 2) {
            modechange()
        }
    }
}

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(diary: DiaryModel(keyDate: Date(), title: "한줄 일기", feeling: .happy, state: .good))
    }
}
