//
//  ContentView.swift
//  SwiftUI_splitText_code
//
//  Created by 김선중 on 2021/03/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(splitText("안녕하세요 서근입니다. 저의 블로그를 찾아와주셔서 감사합니다. 앞으로 열심히 하겠습니다."))
            .padding()
    }
    
    /* 한 문장으로 길게 구성된 텍스트를 화면에 적장하게 나타내기위해 두 줄로 나누워 주는 기능 */
    
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
            ?? text[centerIdx...].firstIndex(of: " ")
            ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
