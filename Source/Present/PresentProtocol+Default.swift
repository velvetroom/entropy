import Foundation

extension PresentProtocol {
    static func addController(model:Model, controller:ApplicationController) {
        controller.addChildViewController(model.controller)
    }
    
    static func addView(model:Model, controller:ApplicationController) {
        controller.view.addSubview(model.controller.view)
    }
}
