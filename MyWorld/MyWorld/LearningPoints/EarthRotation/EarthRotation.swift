//
//  EarthRotation.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/6.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EarthRotation: View {
    @State var isRotation = false
    @State var curEarth:Entity = Entity()
    
    var body: some View {
        ZStack{
            RealityView { content in
                guard let earth = await RealityKitContent.entity(named: "Globe") else {
                    return
                }
                
                earth.setSunlight(intensity: 14)
                earth.scale = SIMD3(repeating: 0.3)
                earth.orientation = .init(angle: 0, axis: [0, 1, 0])
                curEarth = earth
                content.add(earth)
            } update: { content in
                curEarth.components.set(RotationComponent(speed: isRotation ? 0.5 : 0))
            }

            Toggle("Rotation", isOn: $isRotation)
                .toggleStyle(.button)
                .padding(.top, 240)
        }
    }
    init() {
        RotationComponent.registerComponent()
        RotationSystem.registerSystem()
    }
}

#Preview {
    EarthRotation()
}
