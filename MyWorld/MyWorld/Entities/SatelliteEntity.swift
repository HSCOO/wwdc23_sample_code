//
//  SatelliteEntity.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/6.
//

import Foundation
import SwiftUI
import RealityKitContent
import RealityKit

class SatelliteEntity: Entity{
    private var satellite = Entity()
    private let box = Entity()
    private let orbit = Entity()
    
    @MainActor required init() {
        fatalError("init() has not been implemented")
    }
    
    init(_ configuration: Configuration) async {
        super.init()
        
        guard let satellite = await RealityKitContent.entity(named: configuration.name) else {
            return
        }
        self.satellite = satellite
        
        name = configuration.name
        isEnabled = configuration.isVisible
        
        orbit.components.set(RotationComponent(speed: 0))
        orbit.orientation = .init(angle: Float(configuration.initialRotation.radians), axis: [0, 1, 0])
        self.addChild(orbit)
        
        orbit.addChild(box)
        
        box.addChild(satellite)
    }
    
    func update(configuration: Configuration, speed: Float, traceAnchor: Entity) {
        var resetTrace = !configuration.isTraceVisible
        
        let newOrientation = simd_quatf(angle: Float(configuration.inclination.radians), axis: [0, 0, 1])
        if newOrientation != self.orientation{
            resetTrace = true
        }
        orientation = newOrientation
        isEnabled = configuration.isVisible
        
        if var rotation: RotationComponent = orbit.components[RotationComponent.self]{
            rotation.speed = configuration.speedRatio * speed
            orbit.components[RotationComponent.self] = rotation
        }
        
        box.scale = SIMD3(repeating: configuration.scale)
        box.position = [0, 0, configuration.altitude]
        
        
    }
}
