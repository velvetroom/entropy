import UIKit

internal extension Presenter {
    internal weak var topController:UIViewController? {
        get {
            return self
        }
    }
    
    internal weak var topView:UIView? {
        get {
            return self.topController?.view
        }
    }
    
    internal func present<ConcreteController>(
        strategy:PresentationStrategyProtocol.Type, model:Model<ConcreteController>) {
        self.privateQueue.async { [weak self] in
            self?.presentQueued(strategy:strategy, model:model)
        }
    }
    
    private func presentQueued<ConcreteController>(
        strategy:PresentationStrategyProtocol.Type, model:Model<ConcreteController>) {
        self.models.append(model)
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
    
    internal func addView<ConcreteController>(model:Model<ConcreteController>) {
        guard
            let view:UIView = model.view
        else {
            return
        }
        self.view.addSubview(view)
    }
}
