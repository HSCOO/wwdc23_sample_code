//
//  RegularMaterialBgView.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI

struct RegularMaterialBgView: View {
    @State var text:String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(text)
                .padding()
                .background(.regularMaterial, in: .rect(cornerRadius: 5))
            Text(text)
        }
    }
}

#Preview {
    RegularMaterialBgView(text: "Hello world")
}
