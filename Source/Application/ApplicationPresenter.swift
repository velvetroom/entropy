import Foundation

internal final class ApplicationPresenter:ApplicationPresenterProtocol {
    internal weak var controller:ApplicationController?
    internal var models:[Model]
    internal let queue:DispatchQueue

    internal init() {
        self.models = []
        self.queue = ApplicationPresenter.factoryPrivateQueue()
    }
    
    internal func present(model:Model, presentStrategy:PresentProtocol.Type) {
        self.queue.async { [weak self] in
            self?.retainModel(model:model)
            self?.presentWith(strategy:presentStrategy, model:model)
        }
    }
    
    private func retainModel(model:Model) {
        self.models.append(model)
    }
    
    private func presentWith(strategy:PresentProtocol.Type, model:Model) {
        guard
            let controller:ApplicationController = self.controller
        else {
            return
        }
        strategy.present(model:model, controller:controller)
    }
}
