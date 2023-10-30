//
//  MyFirstImmersiveApp.swift
//  MyFirstImmersive
//
//  Created by This is a good guy on 2023/10/30.
//

import SwiftUI

@main
struct MyFirstImmersiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
