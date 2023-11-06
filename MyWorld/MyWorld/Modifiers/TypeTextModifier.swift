//
//  TypeTextModifier.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/3.
//

import SwiftUI

extension View{
    func typeTextAnimation(text: Binding<String>,
                           finlText: String,
                           isFinished: Binding<Bool>,
                           cursor: String = "|",
                           isAnimated: Bool = true) -> some View {
        self.modifier(
            TypeTextModifier(text: text,
                             finlText: finlText,
                             isFinished: isFinished,
                             cursor: cursor,
                             isAnimated: isAnimated
                            )
        )
    }
}


private struct TypeTextModifier: ViewModifier{
    @Binding var text: String
    @State var finlText: String
    @Binding var isFinished: Bool
    @State var cursor: String
    @State var isAnimated: Bool
    
    func body(content: Content) -> some View {
        content
            .onAppear{
                if isAnimated == false{
                    text = finlText
                    isFinished = true
                }
            }
            .task {
                guard isAnimated else {return}
                
                // 闪烁的光标
                for _ in 1...2{
                    text = cursor
                    try? await Task.sleep(for: .milliseconds(500))
                    text = ""
                    try? await Task.sleep(for: .milliseconds(200))
                }
                
                // 遍历显示每个字符+光标
                for index in finlText.indices{
                    text = String(finlText.prefix(through: index)) + cursor
                    let milliseconds = (1 + UInt64.random(in: 0...1)) * 100
                    try? await Task.sleep(for: .milliseconds(milliseconds))
                }
                try? await Task.sleep(for: .milliseconds(400))
                text = finlText
                isFinished = true
            }
    }
}
