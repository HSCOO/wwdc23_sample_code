//
//  MyWorldApp.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/3.
//

import SwiftUI

@main
struct MyWorldApp: App {
    @State private var solarImmersionStyle: ImmersionStyle = .full

    @State private var model = ViewModel()

    var body: some Scene {
        WindowGroup{
            SolarDisplayView()
                .environment(model)
        }
        .windowStyle(.plain)
        
        ImmersiveSpace(id: Module.solar.name) {
            SolarView()
                .environment(model)
        }
        .immersionStyle(selection: $solarImmersionStyle, in: .full)
    }
    
    init() {
        RotationComponent.registerComponent()
        RotationSystem.registerSystem()
        TraceComponent.registerComponent()
        TraceSystem.registerSystem()
    }
}
