//
//  SolarEarthEntity.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

class SolarEarthEntity: Entity {
    /// The model that draws the Earth's surface features.
    private var earth: Entity = Entity()
    /// The Earth's one natural satellite.
    private var moon: SatelliteEntity = SatelliteEntity()
    
    init(name: String) async {
        super.init()
        guard let earth = await RealityKitContent.entity(named: "Earth") else {return}
        self.earth = earth
        
        await moon = SatelliteEntity(.orbitMoonDefault)
        self.addChild(moon)
        self.addChild(earth)
        
        update()
    }
    
    @MainActor required init() {
        super.init()
    }
    
    func update(){
        if var rotation: RotationComponent = earth.components[RotationComponent.self] {
            rotation.speed = 0.045
            earth.components[RotationComponent.self] = rotation
        } else {
            earth.components.set(RotationComponent(speed: 0.045))
        }
        
        moon.update(anchor: self, configuration: .orbitMoonDefault, speed: 0.045)
        move(
            to: Transform(
                scale: SIMD3(repeating: 4.6),
                rotation: orientation,
                translation: [-2, 0.4, -5]),
            relativeTo: parent)
    }
}
