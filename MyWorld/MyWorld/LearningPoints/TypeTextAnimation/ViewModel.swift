/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The stored data for the app.
*/

import SwiftUI

/// The data that the app uses to configure its views.
@Observable
class ViewModel {
    
    // MARK: - Navigation
    var navigationPath: [Module] = []
    var titleText: String = ""
    var isTitleFinished: Bool = false
    var finalTitle: String = "Hello World 1234"
    
    var isShowingSolar: Bool = false
    var solarSunDistance: Double = 700
    var solarSunPosition: SIMD3<Float> {
        [Float(solarSunDistance * sin(Angle.degrees(280).radians)),
         0,
         Float(solarSunDistance * cos(Angle.degrees(280).radians))]
    }
}
