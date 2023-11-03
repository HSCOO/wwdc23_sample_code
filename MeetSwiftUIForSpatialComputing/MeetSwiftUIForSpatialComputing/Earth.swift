//
//  Earth.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Earth: View {
    var body: some View {
        RealityView{content in
            if let earth = try? await ModelEntity(named: "Earth",in: realityKitContentBundle){
                content.add(earth)
            }
        }
    }
}

#Preview {
    Earth()
}
