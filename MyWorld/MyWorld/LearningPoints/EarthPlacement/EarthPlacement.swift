//
//  EarthPlacement.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EarthPlacement: View {
    var body: some View {
        RealityView { content in
            guard let earth = await RealityKitContent.entity(named: "Globe") else {
                return
            }
            content.add(earth)
            earth.setSunlight(intensity: 14)

            earth.scale = SIMD3(repeating: 0.3)
        }
        .placementGestures(initialPosition: Point3D([450,300.0,100.0]))
    }
}

#Preview {
    EarthPlacement()
}
