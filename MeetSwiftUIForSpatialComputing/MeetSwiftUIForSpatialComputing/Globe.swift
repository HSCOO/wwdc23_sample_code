//
//  Globe.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Globe: View {
    @State var rotation = Angle.zero
    @State private var pinLocation: CGPoint?
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        HStack {
            Model3D(named: "Earth",bundle: realityKitContentBundle)
                .rotation3DEffect(rotation, axis: .y)
                .gesture(
                    TapGesture()
                        .onEnded { value in
                            withAnimation(.bouncy) {
                                rotation.degrees += randomRotation()
                            }
                        }
                )
                .gesture(
                    SpatialTapGesture()
                        .targetedToAnyEntity()
                        .onEnded({ value in

                        })
                )
                .padding3D(EdgeInsets3D(trailing: 50, front: 10,back: 10))
            
            Button("back") {
                Task{
                    await dismissImmersiveSpace()
                    openWindow(id: "rootView")
                }
            }
            .buttonStyle(FunFactButtonStyle())
        }
    }
    
    func randomRotation() -> Double {
        Double.random(in: 360...720)
    }
}

#Preview {
    Globe()
}
