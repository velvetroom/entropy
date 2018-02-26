import UIKit

internal extension Presenter {
    internal func present<ConcreteController>(strategy:PresentationStrategyProtocol.Type,
                                              model:Model<ConcreteController>) {
        self.privateQueue.async { [weak self] in
            self?.presentQueued(strategy:strategy, model:model)
        }
    }
    
    private func presentQueued<ConcreteController>(strategy:PresentationStrategyProtocol.Type,
                                                   model:Model<ConcreteController>) {
        self.controllerDelegates.append(model)
        strategy.present(presenter:self, model:model)
    }
    
    internal func addController<ConcreteController>(model:Model<ConcreteController>) {
        guard
            let controller:UIViewController = model.controller as? UIViewController
        else {
            return
        }
        self.addChildViewController(controller)
    }
}
