import UIKit

internal protocol PresentProtocol {
    static func present<ConcreteSignature:AbstractSignature>(signature:ConcreteSignature)
}
