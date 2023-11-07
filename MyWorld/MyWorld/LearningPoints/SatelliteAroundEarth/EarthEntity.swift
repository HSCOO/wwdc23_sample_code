//
//  EarthEntity.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

class EarthEntity: Entity {
    
    /// The model that draws the Earth's surface features.
    private var earth: Entity = Entity()

    /// An entity that rotates 23.5° to create axial tilt.
    private let equatorialPlane = Entity()
    
    /// A container for artificial satellites.
    private var satellites = Entity()
    
    /// The Earth's one natural satellite.
    private var moon: SatelliteEntity = SatelliteEntity()
    
    init(name: String) async {
        super.init()
        guard let earth = await RealityKitContent.entity(named: "Globe") else {return}
        self.earth = earth

        await self.satellites = SatelliteEntity(.orbitSatelliteDefault)
        await moon = SatelliteEntity(.orbitMoonDefault)
        self.addChild(moon)
        
        self.addChild(equatorialPlane)
        equatorialPlane.addChild(earth)
        equatorialPlane.addChild(satellites)
        update()
    }
    
    @MainActor required init() {
        super.init()
    }
    
    func update(){
        if var rotation: RotationComponent = earth.components[RotationComponent.self] {
            rotation.speed = 0.1
            earth.components[RotationComponent.self] = rotation
        } else {
            earth.components.set(RotationComponent(speed: 0.1))
        }
        
        (satellites as? SatelliteEntity)?.update(anchor: earth, configuration: .orbitSatelliteDefault, speed: 0.1)
        moon.update(anchor: self, configuration: .orbitMoonDefault, speed: 0.1)
        
        var planeTransform = equatorialPlane.transform
        planeTransform.rotation = tilt(date: Date())
        equatorialPlane.move(to: planeTransform, relativeTo: self, duration: 0.25)
        
        move(
            to: Transform(
                scale: SIMD3(repeating: 0.3),
                rotation: orientation,
                translation: .zero),
            relativeTo: parent)
    }
    
    /// Calculates the orientation of the Earth's tilt on a specified date.
    ///
    /// This method assumes the sun appears at some distance from the Earth
    /// along the negative x-axis.
    ///
    /// - Parameter date: The date that the Earth's tilt represents.
    ///
    /// - Returns: A representation of tilt that you apply to an Earth model.
    private func tilt(date: Date?) -> simd_quatf {
        // Assume a constant magnitude for the Earth's tilt angle.
        let tiltAngle: Angle = .degrees(date == nil ? 0 : 23.5)

        // Find the day in the year corresponding to the date.
        let calendar = Calendar.autoupdatingCurrent
        let day = calendar.ordinality(of: .day, in: .year, for: date ?? Date()) ?? 1

        // Get an axis angle corresponding to the day of the year, assuming
        // the sun appears in the negative x direction.
        let axisAngle: Float = (Float(day) / 365.0) * 2.0 * .pi

        // Create an axis that points the northern hemisphere toward the
        // sun along the positive x-axis when axisAngle is zero.
        let tiltAxis: SIMD3<Float> = [
            sin(axisAngle),
            0,
            -cos(axisAngle)
        ]

        // Create and return a tilt orientation from the angle and axis.
        return simd_quatf(angle: Float(tiltAngle.radians), axis: tiltAxis)
    }
}

