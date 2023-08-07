//
//  ContentView.swift
//  SimpleMemoApp
//
//  Created by 이현재 on 2023/08/04.
//

import SwiftUI



struct ListItem: View {
    @Binding var memo: MemoItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.title)
                .font(.title3)
            Text(memo.date.fullString())
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var memoItem: MemoItem
    @State var contents: String = ""
    @State var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("타이틀 입력", text: $title)
                .font(.title)
            Text($memoItem.date.wrappedValue.fullString())
            TextField("메모 내용 입력", text: $contents, axis: .vertical)
                .padding()
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup {
                Button {
                    saveMemo()
                } label: {
                    Image(systemName: "checkmark.circle")
                }
            }
        }
    }
    
    func saveMemo() {
        memoItem.contents = contents
        memoItem.title = title
        dismiss()
    }
}

struct ContentView: View {
    
    @StateObject var manager: DataManager = DataManager.shared
    
    func removeItem(at indexSet: IndexSet) {
        if manager.remove(indexSet) {
            
        }
    }
    
    func moveList(from source: IndexSet, to destination: Int) {
        if manager.move(frome: source, to: destination) {
            
        }
    }
    
    func addItem() {
        if manager.add(MemoItem: MemoItem(title: "새로운 메모", contents: "")) {

        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach($manager.dataList) { $item in
                    NavigationLink {
                        DetailView(memoItem: $item)
                    } label: {
                        ListItem(memo: $item)
                    }
                }
                .onDelete(perform: removeItem)
                .onMove(perform: moveList)
            }
            .navigationTitle("메모")
            .toolbar {
                ToolbarItemGroup {
                    EditButton()
                    Button {
                        addItem()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }

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
