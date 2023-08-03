//
//  BlurStackView.swift
//  SimpleWeatherApp
//
//  Created by 이현재 on 2023/08/02.
//

import SwiftUI

struct BlurStackView<Header: View, Content: View>: View {
    
    var headerView: Header
    var contentView: Content
    
    @State var topOffset: CGFloat = 0
    @State var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder headerView: @escaping () -> Header,
         @ViewBuilder contentView: @escaping () -> Content) {
        self.headerView = headerView()
        self.contentView = contentView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(.white)
                .background(.ultraThinMaterial, in: IndividualCorner(corners: bottomOffset <= 50 ? .allCorners : [.topLeft, .topRight], radius: 15))
                .zIndex(1)
            
            Divider()

            contentView
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ultraThinMaterial, in: IndividualCorner(corners: bottomOffset <= 50 ? .allCorners : [.bottomLeft, .bottomRight], radius: 15))
                .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
                .zIndex(0)
                .clipped()
        }
//        .cornerRadius(15)
        .offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
        .background(GeometryReader(content: { geo -> Color in
            let minY = geo.frame(in: .global).minY
            let maxY = geo.frame(in: .global).maxY
            DispatchQueue.main.async {
                topOffset = minY
                bottomOffset = maxY
            }
            return Color.clear
        }))
        .padding()
    }
}

struct BlurStackView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
