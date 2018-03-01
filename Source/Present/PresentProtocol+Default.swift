import Foundation

internal extension PresentProtocol {
    internal static func addViewController(model:AbstractModelProtocol, viewController:ApplicationViewController) {
        viewController.addChildViewController(model.controller)
    }
}
