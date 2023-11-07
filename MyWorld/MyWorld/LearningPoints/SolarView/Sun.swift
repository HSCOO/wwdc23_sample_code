//
//  Sun.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Sun: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    /// The sun entity that the view creates and stores for later updates.
    @State private var sun: Entity?

    var body: some View {
        RealityView { content in
            guard let sun = await RealityKitContent.entity(named: "Sun") else {
                return
            }

            content.add(sun)
            self.sun = sun
            configure()

        } update: { content in
            configure()
        }
    }

    /// Configures the model based on the current set of inputs.
    private func configure() {
        sun?.scale = SIMD3(repeating: scale)
        sun?.position = position
    }
}

#Preview {
    Sun(scale: 0.1)
}
