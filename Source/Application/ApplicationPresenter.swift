import UIKit

internal final class ApplicationPresenter:ApplicationPresenterProtocol {
    internal weak var viewController:ApplicationViewController?

    internal func present<ConcreteSignature>(
        model:AbstractModel<ConcreteSignature>, presentStrategy:PresentProtocol.Type) {
        
    }
}
