import RealityKit

public enum Region: String, Codable{
    case catalina
    case yosemite
}

// Ensure you register this component in your app’s delegate using:
// PointOfInsertComponent.registerComponent()
public struct PointOfInsertComponent: Component, Codable {
    // This is an example of adding a variable to the component.
    var region: Region = .yosemite

    public init() {
        
    }
}
