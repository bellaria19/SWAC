//
//  ForecaseView.swift
//  SimpleWeatherApp
//
//  Created by 이현재 on 2023/08/02.
//

import SwiftUI

struct ForecastView: View {
    
    var time: String
    var imageName: String
    var celcius: CGFloat
    
    var body: some View {
        VStack {
            Text(time)
//                .fontWeight(.bold)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .font(.title3)
                .symbolVariant(.fill)
                .symbolRenderingMode(.multicolor)
                .frame(height: 30)
            
            Text("\(Int(celcius))°")
                .foregroundColor(.white)
//                .fontWeight(.bold)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(time: "지금", imageName: "cloud.moon", celcius: 13)
    }
}
