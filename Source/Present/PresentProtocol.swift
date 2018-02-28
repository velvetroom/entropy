import Foundation

internal protocol PresentProtocol {
    static func present<ConcreteSignature:AbstractSignature>(
        model:AbstractModel<ConcreteSignature>,
        viewController:ApplicationViewController)
}
