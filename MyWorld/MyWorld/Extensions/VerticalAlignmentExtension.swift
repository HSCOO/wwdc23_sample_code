//
//  VerticalAlignmentExtension.swift
//  MyWorld
//
//  Created by This is a good guy on 2023/11/3.
//

import Foundation
import SwiftUI

extension VerticalAlignment{
    private struct EarthAligment: AlignmentID{
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }
    
    static let earthGuide = VerticalAlignment(EarthAligment.self)
}
