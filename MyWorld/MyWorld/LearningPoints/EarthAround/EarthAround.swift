//
//  EarthAround.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/13.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EarthAround: View {
    var body: some View {
        RealityView { content in
            guard let earth = await RealityKitContent.entity(named: "Earth") else {
                return
            }
            
            let orbit = Entity()
            // 添加一个Y轴旋转
            orbit.components.set(RotationComponent(speed: 0.5))
            content.add(orbit)

            // 为了让地球更立体，添加光线
            earth.setSunlight(intensity: 14)
            // 地球模型太大，适当的缩放，避免超出窗口
            earth.scale = SIMD3(repeating: 0.1)
            // 设置Z轴偏移
            earth.position = [0,0,0.1]
            orbit.addChild(earth)
        }
    }
    init() {
        RotationComponent.registerComponent()
        RotationSystem.registerSystem()
    }
}

#Preview {
    EarthAround()
}
