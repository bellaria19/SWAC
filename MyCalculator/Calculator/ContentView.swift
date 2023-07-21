//
//  ContentView.swift
//  Calculator
//
//  Created by CNU on 2023/07/14.
//

import SwiftUI

enum ButtonType {
    case one, two, three, four, five, six, seven, eight, nine, zero
    
    case dot, equal, plus, minus, multiply, divide
    
    case percent, opposite, clear

    var buttonDisplayName: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .zero:
            return "0"
        case .dot:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "X"
        case .divide:
            return "÷"
        case .percent:
            return "%"
        case .opposite:
            return "+/-"
        case .clear:
            return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .dot :
            return Color("NumberButton")
        case .equal, .plus, .minus, .multiply, .divide:
            return .orange
        case .percent, .opposite, .clear:
            return .gray
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven,
                .eight, .nine, .zero, .dot, .equal, .plus,
                .minus, .multiply, .divide:
            return .white
        case .percent, .opposite, .clear:
            return .black
        }
    }
    
}

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    @State var tempNumber: Int = 0
    @State var operatorType: ButtonType = .clear
    @State private var isNotEdit: Bool = true
    
    private let buttonData: [[ButtonType]] = [
        [.clear, .opposite, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]]
 
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                }
                ForEach(buttonData, id: \.self) { row in
                    HStack {
                        ForEach(row, id:\.self) { item in
                            Button {
                                if item == .clear {
                                    totalNumber = "0"
                                    isNotEdit = true
                                } else {
                                    if isNotEdit {
                                        if item == .plus || item == .minus
                                            || item == .multiply || item == .divide
                                            || item == .equal {
                                            totalNumber = "E"
                                        } else {
                                            totalNumber = item.buttonDisplayName
                                            isNotEdit.toggle()
                                        }
                                    } else {
                                        if item == .equal {
                                            if operatorType == .plus {
                                                totalNumber = String(tempNumber + (Int(totalNumber) ?? 0))
                                            } else if operatorType == .minus {
                                                totalNumber = String(tempNumber - (Int(totalNumber) ?? 0))
                                            } else if operatorType == .multiply {
                                                totalNumber = String(tempNumber * (Int(totalNumber) ?? 0))
                                            } else if operatorType == .divide {
                                                totalNumber = String(tempNumber / (Int(totalNumber) ?? 0))
                                            } else {
                                                totalNumber = String(tempNumber % (Int(totalNumber) ?? 0))
                                            }
                                        } else if item == .plus || item == .minus || item == .multiply || item == .divide || item == .percent {
                                            tempNumber = Int(totalNumber) ?? 0
                                            operatorType = item
                                            isNotEdit = true
                                        } else {
                                            if isNotEdit {
                                                totalNumber = item.buttonDisplayName
                                                isNotEdit.toggle()
                                            } else {
                                                totalNumber += item.buttonDisplayName
                                            }
                                        }
                                    }
                                }
                                
                            } label: {
                                Text(item.buttonDisplayName)
                                    .bold()
                                    .frame(width: calculateButtonWidth(button: item), height: calculateButtonHeight(button: item))
                                    .background(item.backgroundColor)
                                    .cornerRadius(50)
                                    .foregroundColor(item.foregroundColor)
                                    .font(.system(size: 33))
                            }
                        }
                    }
                }
//                HStack {
//                    Button {
//                        if totalNumber == "0" {
//                            totalNumber = "7"
//                        } else {
//                            totalNumber += "7"
//                        }
//
//                    } label: {
//                        Text("7")
//                            .frame(width: 80, height: 80)
//                            .background(Color("NumberButton"))
//                            .cornerRadius(50)
//                            .foregroundColor(.white)
//                            .font(.system(size: 33))
//                    }
//                    Text("8")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("9")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("x")
//                        .frame(width: 80, height: 80)
//                        .background(.orange)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                }
//                HStack {
//                    Text("4")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("5")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("6")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("-")
//                        .frame(width: 80, height: 80)
//                        .background(.orange)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                }
//                HStack {
//                    Text("1")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("2")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("3")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("+")
//                        .frame(width: 80, height: 80)
//                        .background(.orange)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                }
//                HStack {
//                    Text("0")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("0")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text(".")
//                        .frame(width: 80, height: 80)
//                        .background(.gray)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                    Text("=")
//                        .frame(width: 80, height: 80)
//                        .background(.orange)
//                        .cornerRadius(50)
//                        .foregroundColor(.white)
//                        .font(.system(size: 33))
//                }
            }
        }
    }
    private func calculateButtonWidth(button: ButtonType) -> CGFloat {
        switch button{
        case .zero:
            return (UIScreen.main.bounds.width - 5 * 10) / 2
        default:
            return (UIScreen.main.bounds.width - 5 * 10) / 4
        }
        // 버튼 한 개의 width, height = (전체 너비 - 버튼 사이의 공간의 수(5) * num) / 4
    }
    
    private func calculateButtonHeight(button: ButtonType) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 10) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
