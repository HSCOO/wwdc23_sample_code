//
//  MeetSwiftUIForSpatialComputingApp.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI

@main
struct MeetSwiftUIForSpatialComputingApp: App {
    @State private var selectedStyle: ImmersionStyle = .full
    
    @State private var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }

        ImmersiveSpace(id: "globe") {
            Globe()
                .onAppear{
                    viewModel.isShowGlobe = true
                }
                .onDisappear{
                    viewModel.isShowGlobe = false
                }
        }
        .immersionStyle(selection: $selectedStyle, in: .full)
    }
}
