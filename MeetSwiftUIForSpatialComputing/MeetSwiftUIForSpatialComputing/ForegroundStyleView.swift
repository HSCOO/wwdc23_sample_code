//
//  ForegroundStyleView.swift
//  MeetSwiftUIForSpatialComputing
//
//  Created by This is a good guy on 2023/11/1.
//

import SwiftUI

struct ForegroundStyleView: View {
    @State var text:String
    var body: some View {
        VStack {
            Text(text)
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding()
            Text(text)
                .padding()
                .font(.caption)
        }
    }
}

#Preview {
    ForegroundStyleView(text: "Learn more")
}
