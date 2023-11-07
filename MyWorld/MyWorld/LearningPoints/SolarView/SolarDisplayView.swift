//
//  SolarDisplayView.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI

// 进入沉浸式空间的入口
struct SolarDisplayView: View {
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        ZStack {
            SolarSystemToggle()
                .opacity(model.isShowingSolar ? 1 : 0)
            VStack{
                Text("进入沉浸式空间")
                    .font(.system(size: 50, weight: .bold))
                    .padding(.bottom, 15)
                SolarSystemToggle()
            }
            .opacity(model.isShowingSolar ? 0 : 1)
        }
    }
}

#Preview {
    SolarDisplayView()
}
