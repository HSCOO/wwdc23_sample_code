//
//  SolarEarth.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import _RealityKit_SwiftUI

struct SolarEarth: View {
    var body: some View {
        RealityView { content in
            let moonEarthEntity = await SolarEarthEntity(name: "")
            moonEarthEntity.setSunlight(intensity: 14)
            content.add(moonEarthEntity)
            moonEarthEntity.update()
        }
    }
}

#Preview {
    MoonAroundEarth()
}
