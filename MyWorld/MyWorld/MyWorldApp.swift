//
//  MyWorldApp.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/3.
//

import SwiftUI

@main
struct MyWorldApp: App {
    @State private var model = ViewModel()

    var body: some Scene {
        WindowGroup {
            EarthRotation()
                .environment(model)
        }
    }
    
    init() {
        RotationComponent.registerComponent()
        RotationSystem.registerSystem()
        TraceComponent.registerComponent()
        TraceSystem.registerSystem()
    }
}
