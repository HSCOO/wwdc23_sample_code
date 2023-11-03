//
//  ContentView.swift
//  Dioramas
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var enlarge = false

    var body: some View {
        VStack {
            RealityView { content, _ in
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                }
            } update: { content, attachments in
                if let scene = content.entities.first {
                    let uniformScale: Float = enlarge ? 1.4 : 1.0
                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
                }
                
                if let attachEntity = attachments.entity(for: "🐟"){
                    content.add(attachEntity)
                }
            } attachments: {
                Button("Name") {
                    
                }
                .background(.green)
                .tag("🐟")
            }.gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
                enlarge.toggle()
            })

            VStack {
                Toggle("Enlarge RealityView Content", isOn: $enlarge)
                    .toggleStyle(.button)
            }.padding().glassBackgroundEffect()
        }
    }
    
    
    func playOcenSound() {
        
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
