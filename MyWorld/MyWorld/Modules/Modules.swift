//
//  Modules.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/3.
//

import SwiftUI

struct Modules: View {
    @Environment(ViewModel.self) private var model
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        NavigationStack(path: $model.navigationPath) {
            TableOfContents()
                .navigationDestination(for: Module.self) { module in
                    ModuleDetail(module: module)
                        .navigationTitle(module.eyebrow)
                }
        }
    }
}

#Preview {
    Modules()
}
