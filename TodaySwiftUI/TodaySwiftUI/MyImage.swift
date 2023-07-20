//
//  MyImage.swift
//  TodaySwiftUI
//
//  Created by 이현재 on 2023/07/20.
//

import SwiftUI

struct MyImage: View {
    var body: some View {
        //        Image("")
        //            .resizable()
        //            .aspectRatio(contentMode: .fit)
        //            // .fit .fill
        //            .frame(width: 200, height: 200)
        //            .background(.orange)
        //            // 자르기 .clipped()
        //            .border(.secondary, width: 6)
    Image(systemName: "heart")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
    }
}

struct MyImage_Previews: PreviewProvider {
    static var previews: some View {
        MyImage()
    }
}
