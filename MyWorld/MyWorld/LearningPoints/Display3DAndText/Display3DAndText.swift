//
//  Display3DAndText.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI

struct Display3DAndText: View {
    var body: some View {
        GeometryReader { proxy in
            let textWidth = min(max(proxy.size.width * 0.4, 300), 500)
            let imageWidth = min(max(proxy.size.width - textWidth, 300), 700)
            HStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 50, weight: .bold))
                .padding(.bottom, 15)
                
                OrbitView()
                    .frame(width: imageWidth, alignment: .center)
            }
        }
    }
}

#Preview {
    Display3DAndText()
}
