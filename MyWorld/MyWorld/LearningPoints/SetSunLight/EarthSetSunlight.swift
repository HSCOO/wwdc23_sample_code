//
//  EarthSetSunlight.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/6.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EarthSetSunlight: View {
    @State var intensity: Float = 14
    @State var showSunlight = false
    @State var curEarth:Entity?
    
    var body: some View {
        ZStack{
            RealityView { content in
                guard let earth = await RealityKitContent.entity(named: "Earth") else {
                    return
                }
                content.add(earth)
                earth.scale = SIMD3(repeating: 0.3)
                curEarth = earth
            } update: { content in
                curEarth?.setSunlight(intensity: showSunlight ? intensity : 8)
            }

            Toggle("Sunlight", isOn: $showSunlight)
                .toggleStyle(.button)
                .padding(.top, 240)
        }
    }
}

#Preview {
    EarthSetSunlight()
}
