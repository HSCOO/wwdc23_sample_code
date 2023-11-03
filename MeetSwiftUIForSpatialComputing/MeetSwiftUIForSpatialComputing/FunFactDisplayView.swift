//
//  FunFactButton.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI

struct FunFactDisplayView:View {
    var body: some View{
        VStack(alignment: .leading){
            Text("Fun Facts")
                .font(.largeTitle)
                .padding()
            HStack{
                FunFactButton(title: "Hello",
                              content: "Hello world")
                FunFactButton(title: "Hello",
                              content: "Hello world")
                FunFactButton(title: "Hello",
                              content: "Hello world")
            }
        }
    }
}

struct FunFactButton: View {
    @State var title:String
    @State var content:String
    
    var body: some View {
        Button {
            
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                    Text(title)
                        .font(.title2)
                        .lineLimit(2)
                    Text(content)
                        .font(.body)
                        .lineLimit(4)
                    Text("Learn more")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(width: 180, alignment: .leading)
        }
        .buttonStyle(FunFactButtonStyle())
    }
}

struct FunFactButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                    .padding()
                    .background(.regularMaterial, in: .rect(cornerRadius: 12))
                    .hoverEffect()
                    .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

#Preview {
    FunFactDisplayView()
}
