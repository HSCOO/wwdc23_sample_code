//
//  TableOfContents.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/3.
//

import SwiftUI

struct TableOfContents: View {
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        @Bindable var model = model
        
        VStack{
            Image("SunSliver")
                .opacity(model.isTitleFinished ? 1 : 0)
                .accessibilityHidden(true)
            Spacer(minLength: 120)
            
            VStack{
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
            .alignmentGuide(.earthGuide, computeValue: { dimension in
                dimension[VerticalAlignment.top]
            })
            .padding(.bottom, 40)
            
            HStack(alignment: .top,spacing: 30, content: {
                ForEach(Module.allCases){
                    ModuleCard(module: $0)
                }
            })
            .padding(.bottom, 50)
            .opacity(model.isTitleFinished ? 1 : 0)
            
            Spacer()
        }
        .padding(.horizontal, 50)
        .background(alignment: Alignment(horizontal: .center, 
                                         vertical: .earthGuide)) {
            Image("EarthHalf")
                .alignmentGuide(.earthGuide, computeValue: { dimension in
                    dimension[VerticalAlignment.top] + 100
                })
                .opacity(model.isTitleFinished ? 1 : 0)
                .accessibilityHidden(true)
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
    NavigationStack {
        TableOfContents()
            .environment(ViewModel())
    }
}
