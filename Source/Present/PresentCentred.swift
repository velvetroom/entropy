import Foundation

internal final class PresentCentred:PresentProtocol {
    internal class func present(model:AbstractModel, viewController:ApplicationViewController) {
        self.addViewController(model:model, viewController:viewController)
    }
}
