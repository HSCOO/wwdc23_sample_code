//
//  EarthEntity.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/6.
//

import Foundation
import SwiftUI
import RealityKitContent
import RealityKit

class EarthEntity: Entity{
    private var earth: Entity = Entity()
    
    private var equatorialPlane = Entity()
    
    private let rotator = Entity()
    
    private var pole: Entity = Entity()
}
