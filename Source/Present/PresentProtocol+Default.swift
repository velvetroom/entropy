import Foundation

internal extension PresentProtocol {
    internal static func addController(model:Model, controller:ApplicationController) {
        controller.addChildViewController(model.controller)
    }
    
    internal static func addView(model:Model, controller:ApplicationController) {
        controller.view.addSubview(model.controller.view)
    }
}
