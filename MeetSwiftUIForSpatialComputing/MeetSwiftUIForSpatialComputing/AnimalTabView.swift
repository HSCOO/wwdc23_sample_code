//
//  AnimalTabView.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI

struct AnimalTabView: View {
    var body: some View {
        TabView{
            AnimalCardView(name: "Dogs")
            .tabItem {
                Label {
                    Text("Dogs")
                } icon: {
                    Image("dogs")
                }
            }
            
            AnimalCardView(name: "Cats")
            .tabItem {
                Label {
                    Text("Cats")
                } icon: {
                    Image("cats")
                }
            }
            
            AnimalCardView(name: "Birds")
            .tabItem {
                Label {
                    Text("Birds")
                } icon: {
                    Image("birds")
                }
            }
        }
    }
}

struct AnimalCardView: View {
    @State var name: String
    
    var body: some View {
        CardView {
            VStack {
                RegularMaterialBgView(text: name)
                Divider()
                ForegroundStyleView(text: "Learn more")
                FunFactDisplayView()
            }
        }
    }
}

struct CardView<Content:View>: View {
    @ViewBuilder var content:Content
    
    var body: some View{
        content
    }
}

#Preview {
    AnimalTabView()
}
