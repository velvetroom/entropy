import Foundation

internal extension PresentProtocol {
    internal static func addViewController(model:AbstractModel, viewController:ApplicationViewController) {
        viewController.addChildViewController(model.controller)
    }
}
