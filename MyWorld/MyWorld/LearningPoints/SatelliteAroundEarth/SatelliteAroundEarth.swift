//
//  SatelliteAroundEarth.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import RealityKit

struct SatelliteAroundEarth: View {
    @State private var earthEntity: EarthEntity?

    var body: some View {
        RealityView { content in
            let earth = await EarthEntity(name: "")
            earth.setSunlight(intensity: 14)
            content.add(earth)
            
            self.earthEntity = earth
            earth.update()
        } 
    }
    
    init() {
        TraceComponent.registerComponent()
        TraceSystem.registerSystem()
    }
}

#Preview {
    SatelliteAroundEarth()
}
