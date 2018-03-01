import Foundation

internal final class ApplicationPresenter:ApplicationPresenterProtocol {
    internal weak var viewController:ApplicationViewController?

    internal func present(model:AbstractModel, presentStrategy:PresentProtocol.Type) {
        DispatchQueue.main.async { [weak self] in
            guard
                let viewController:ApplicationViewController = self?.viewController
            else {
                return
            }
            presentStrategy.present(model:model, viewController:viewController)
        }
    }
}
