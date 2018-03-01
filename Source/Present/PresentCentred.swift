import Foundation

internal final class PresentCentred:PresentProtocol {
    internal class func present(model:AbstractModel, controller:ApplicationController) {
        self.addController(model:model, controller:controller)
        self.addView(model:model, controller:controller)
    }
}
