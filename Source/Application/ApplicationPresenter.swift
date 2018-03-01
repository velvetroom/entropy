import Foundation

internal final class ApplicationPresenter:ApplicationPresenterProtocol {
    internal weak var controller:ApplicationController?

    internal func present(model:AbstractModel, presentStrategy:PresentProtocol.Type) {
        DispatchQueue.main.async { [weak self] in
            guard
                let controller:ApplicationController = self?.controller
            else {
                return
            }
            presentStrategy.present(model:model, controller:controller)
        }
    }
}
