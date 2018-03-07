import Foundation

internal final class ApplicationPresenter:ApplicationPresenterProtocol {
    internal weak var controller:ApplicationController?
    internal let queue:DispatchQueue

    internal init() {
        self.queue = ApplicationPresenter.factoryPrivateQueue()
    }
    
    internal func present(model:Model, presentStrategy:PresentProtocol.Type) {
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
