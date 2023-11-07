//
//  SolarSystem.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/7.
//

import SwiftUI
// 沉浸式空间显示的内容
struct SolarView: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        ZStack{
            SolarEarth()
            Sun(scale: 50, position: model.solarSunPosition)
            Starfield()
            SolarSystemToggle()
                .environment(model)
        }
        .onAppear {
            model.isShowingSolar = true
            var announcement = AttributedString("Entered the immersive star filled solar system!")
            announcement.accessibilitySpeechAnnouncementPriority = .high
            AccessibilityNotification.Announcement(announcement).post()
        }
        .onDisappear {
            model.isShowingSolar = false
        }
    }
}

#Preview {
    SolarView()
        .environment(ViewModel())
}
