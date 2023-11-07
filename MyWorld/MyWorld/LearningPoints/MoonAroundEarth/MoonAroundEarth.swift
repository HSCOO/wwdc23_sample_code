//
//  MoonAroundEarth.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import _RealityKit_SwiftUI

struct MoonAroundEarth: View {
    var body: some View {
        RealityView { content in
            let moonEarthEntity = await MoonEarthEntity(name: "")
            moonEarthEntity.setSunlight(intensity: 14)
            content.add(moonEarthEntity)
            moonEarthEntity.update()
        }
        .placementGestures(initialPosition: Point3D([450,300.0,100.0]))
    }
}

#Preview {
    MoonAroundEarth()
}
