//
//  ContentView.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/3.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
        }
        .padding()
    }
    
    init() {
        print("Module.globe.name \(Module.globe.name)")
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
