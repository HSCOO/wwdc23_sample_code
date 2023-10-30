//
//  ImmersiveView.swift
//  MyVisionTest
//
//  Created by This is a good guy on 2023/10/30.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "ImmersiveScene", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded({ value in
            var transform = value.entity.transform
            transform.translation += SIMD3(0, -0.1, 0)
            value.entity.move(to: transform,
                              relativeTo: nil,
                              duration: 3,
                              timingFunction: .easeInOut)
        }))
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
