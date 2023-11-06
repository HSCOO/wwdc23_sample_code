//
//  GlobeToggle.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/6.
//

import SwiftUI

struct GlobeToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        @Bindable var model = model
        Text("Hello")
    }
}

#Preview {
    GlobeToggle()
}
