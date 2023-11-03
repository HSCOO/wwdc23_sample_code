//
//  ContentView.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        VStack {
            AnimalTabView()
            Model3D(named: "Scene", bundle: realityKitContentBundle)
            Button {
                if model.isShowGlobe{
                    return
                }
                Task{
                    await openImmersiveSpace(id: "globe")
                }
            } label: {
                Text("Jump to Globe")
            }
            .buttonStyle(FunFactButtonStyle())
        }
        .padding()
    }
}

struct CustomLabel: LabelStyle {
    var spacing: Double = 0.0
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: spacing) {
            configuration.icon
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            configuration.title
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
