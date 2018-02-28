import Foundation

internal extension PresentProtocol {
    internal static func addViewController<SpecialisedSignature>(
        model:AbstractModel<SpecialisedSignature>,
        viewController:ApplicationViewController) {
        viewController.addChildViewController(model.controller)
    }
}
