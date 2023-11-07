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
    
    init(_ configuration: Configuration) async {
        super.init()
        
        guard let satellite = await RealityKitContent.entity(named: configuration.name) else { return }
        self.satellite = satellite
        
        orbit.components.set(RotationComponent(speed: 0))
        orbit.orientation = .init(angle: Float(configuration.initialRotation.radians), axis: [0,1,0])
        self.addChild(orbit)
        
        orbit.addChild(box)
        box.addChild(satellite)
    }
    
    @MainActor required init() {
        super.init()
    }
    
    func update(anchor: Entity, configuration: Configuration, speed: Float){
        // 飞行器的偏移角度
        let newOrientation = simd_quatf(angle: Float(configuration.inclination.radians), axis: [0, 0, 1])
        orientation = newOrientation
        
        if var rotation: RotationComponent = orbit.components[RotationComponent.self]{
            rotation.speed = configuration.speedRatio * speed
            orbit.components[RotationComponent.self] = rotation
        }
        
        box.scale = SIMD3(repeating: configuration.scale)
        box.position = [0,0,configuration.altitude]
        
        satellite.updateTrace(anchor: anchor,
                              width: configuration.traceWidth,
                              isVisible: configuration.isTraceVisible,
                              isPaused: false)
    }
}

