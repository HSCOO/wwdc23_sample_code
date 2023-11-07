//
//  TypingText.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI

struct TypingText: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        @Bindable var model = model
        
        VStack {
            TitleText(title: model.finalTitle)
                .padding(.horizontal, 70)
                .hidden()
                .overlay(alignment: .leading){
                    TitleText(title: model.titleText)
                        .padding(.leading, 70)
                }
                .typeTextAnimation(text: $model.titleText,
                                   finlText: model.finalTitle,
                                   isFinished: $model.isTitleFinished,
                               isAnimated: !model.isTitleFinished)
            
            Text("Discover a new way of looking at the world.")
                .font(.title)
                .opacity(model.isTitleFinished ? 1 : 0)
        }
        .animation(.default.speed(0.25), value: model.isTitleFinished)
    }
}

struct TitleText: View {
    var title: String
    var body: some View{
        Text(title)
            .monospaced()
            .font(.system(size: 50, weight: .bold))
    }
}

#Preview {
    TypingText()
        .environment(ViewModel())
}
