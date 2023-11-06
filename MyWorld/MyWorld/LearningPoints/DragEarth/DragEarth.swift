//
//  DragEarth.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/6.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DragEarth: View {
    var body: some View {
        RealityView { content in
            guard let earth = await RealityKitContent.entity(named: "Globe") else {
                return
            }
            content.add(earth)
            earth.setSunlight(intensity: 14)

            earth.scale = SIMD3(repeating: 0.3)
        }
        .dragRotation(pitchLimit: .degrees(90))
    }
}

#Preview {
    DragEarth()
}
