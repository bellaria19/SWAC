//
//  IndividualCorner.swift
//  SimpleWeatherApp
//
//  Created by 이현재 on 2023/08/03.
//

import SwiftUI

struct IndividualCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
