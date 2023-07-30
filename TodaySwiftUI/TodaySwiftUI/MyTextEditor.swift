//
//  MyTextEditor.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/27.
//

import SwiftUI

struct MyTextEditor: View {
    
    @State var inputText: String = ""
    var body: some View {
        ZStack {
            
            TextEditor(text: $inputText)
                .scrollContentBackground(.hidden)
                .background(.red)
                .padding()
                .background(.green)
                .foregroundColor(.black)
                .frame(height: 300)
                .multilineTextAlignment(.center)
                .onChange(of: inputText) { newValue in
                    print(newValue)
                }
        }
    }
}

struct MyTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        MyTextEditor()
    }
}
