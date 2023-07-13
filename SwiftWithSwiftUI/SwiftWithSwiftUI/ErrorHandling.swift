//
//  ErrorHandling.swift
//  SwiftWithSwiftUI
//
//  Created by CNU on 2023/07/12.
//

import SwiftUI

enum numberError: Error {
    case dividedByZero
}

enum NetworkError: String, Error {
    case notFound = "페이지를 찾을 수 없습니다2."
    case forbiden
    case internalServer
    case timeOut
}


struct ErrorHandling: View {
    
    @State var response: String = "not yet"
    @State var inputNumber: String = ""
    
    var body: some View {
        VStack {
            HStack {
                // 200 - ok
                // 404 - not found
                // 403 - forbiden
                // 501 - internal
                // time out
                Text("서버의 응답은 무엇인가요?")
                //Text("100을 몇으로 나눌까요?")
                TextField("number",
                          text: $inputNumber)
            }
            Text(response)
//            Text(number.description)
            Button {
                do {
//                    number = try divideHundred(by: inputNumber)
                    response = try requestData(by: inputNumber)
                } catch NetworkError.forbiden {
                    print("권한이 없습니다")
                    //print("error: \(error)")
                } catch NetworkError.notFound {
                    print(NetworkError.notFound.rawValue)
                } catch NetworkError.internalServer {
                    print("서버와의 통신이 불안정합니다.")
                } catch NetworkError.timeOut {
                    print("요청 시간이 초과 되었습니다. 다시 시도해주세요")
                } catch {
                    print("UnExpected!")
                }
            } label: {
                Text("Click")
            }

        }
    }
    
    private func requestData(by response: String) throws -> String {
        if response == "200" {
            return "OK"
        } else if response == "403" {
            throw NetworkError.forbiden
        } else if response == "404" {
            throw NetworkError.notFound
        } else if response == "501" {
            throw NetworkError.internalServer
        } else {
            throw NetworkError.timeOut
        }
    }
    
    private func divideHundred(by inputNumber: String) throws -> Int {
        if inputNumber == "0" {
            throw numberError.dividedByZero
        } else {
            return 100 / (Int(inputNumber) ?? 0 )
        }

    }
}

struct ErrorHandling_Previews: PreviewProvider {
    static var previews: some View {
        ErrorHandling()
    }
}
