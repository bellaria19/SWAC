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
    
    init(@ViewBuilder headerView: @escaping () -> Header,
         @ViewBuilder contentView: @escaping () -> Content) {
        self.headerView = headerView()
        self.contentView = contentView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .zIndex(1)
            
            Divider()

            contentView
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .offset(y: topOffset >= 200 ? 0 : topOffset - 200)
                .zIndex(0)
                .clipped()
        }
        .offset(y: topOffset >= 200 ? 0 : -(topOffset - 200))
        .background(GeometryReader(content: { geo -> Color in
            let minY = geo.frame(in: .global).minY
            DispatchQueue.main.async {
                topOffset = minY
            }
            return Color.clear
        }))
        .padding()
        .cornerRadius(15)
    }
}

struct BlurStackView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
