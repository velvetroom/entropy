import Foundation

internal extension PresentProtocol {
    internal static func addController(model:AbstractModel, controller:ApplicationController) {
        controller.addChildViewController(model.controller)
    }
    
    internal static func addView(model:AbstractModel, controller:ApplicationController) {
        controller.view.addSubview(model.controller.view)
    }
}
