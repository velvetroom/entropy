import Foundation

internal protocol PresentProtocol {
    static func present<SpecialisedSignature>(
        model:AbstractModel<SpecialisedSignature>,
        viewController:ApplicationViewController)
}
