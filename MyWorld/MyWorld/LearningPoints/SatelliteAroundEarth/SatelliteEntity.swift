//
//  SatelliteEntity.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

class SatelliteEntity: Entity {
    
    private var satellite = Entity()
    private let box = Entity()
    private let orbit = Entity()
    
    init(xx: String) async {
        super.init()
        
        guard let satellite = await RealityKitContent.entity(named: "Satellite") else { return }
        self.satellite = satellite
        
        name = "Satellite"
        
        orbit.components.set(RotationComponent(speed: 0))
        orbit.orientation = .init(angle: 0, axis: [0,1,0])
        self.addChild(orbit)
        
        orbit.addChild(box)
        box.addChild(satellite)
    }
    
    @MainActor required init() {
        super.init()
    }
    
    func update(anchor: Entity){
        // 飞行器的偏移角度
        let newOrientation = simd_quatf(angle: Float(Angle.degrees(60).radians), axis: [0, 0, 1])
        orientation = newOrientation
        
        if var rotation: RotationComponent = orbit.components[RotationComponent.self]{
            rotation.speed = 1.0
            orbit.components[RotationComponent.self] = rotation
        }
        
        box.scale = SIMD3(repeating: 1.2)
        box.position = [0,0,0.5]
        
        satellite.updateTrace(anchor: anchor,
                              width: 400,
                              isVisible: true,
                              isPaused: false)
    }
}

