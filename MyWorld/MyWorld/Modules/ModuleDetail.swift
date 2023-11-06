//
//  ModuleDetail.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/6.
//

import SwiftUI

struct ModuleDetail: View {
    @Environment(ViewModel.self) private var model
    
    @State var module: Module
    
    var body: some View {
        @Bindable var model = model
        
        GeometryReader(content: { geometry in
            let textWidth = min(max(geometry.size.width * 0.4, 300), 500)
            let imageWidth = min(max(geometry.size.width - textWidth, 300), 700)
            
            ZStack{
                HStack(spacing: 60, content: {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(module.heading)
                            .font(.system(size: 50, weight: .bold))
                            .padding(.bottom, 15)
                            .accessibilitySortPriority(4)

                        Text(module.overview)
                            .padding(.bottom, 30)
                            .accessibilitySortPriority(3)
                    })
                    .frame(width: textWidth, alignment: .leading)
                })
                .offset(y: -30)
            }
        })
    }
}

#Preview {
    NavigationStack {
        ModuleDetail(module: .solar)
            .environment(ViewModel())
    }
}
