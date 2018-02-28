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
    
    internal func present<ConcreteModel:ModelProtocol>(
        strategy:PresentationStrategyProtocol.Type, model:ConcreteModel) {
        self.privateQueue.async { [weak self] in
            self?.presentQueued(strategy:strategy, model:model)
        }
    }
    
    private func presentQueued<ConcreteModel:ModelProtocol>(
        strategy:PresentationStrategyProtocol.Type, model:ConcreteModel) {
        self.models.append(model)
        strategy.present(presenter:self, model:model)
    }
    
    internal func addController<ConcreteModel:ModelProtocol>(model:ConcreteModel) {
        guard
            let controller:UIViewController = model.controller as? UIViewController
        else {
            return
        }
        self.addChildViewController(controller)
    }
    
    internal func addView<ConcreteModel:ModelProtocol>(model:ConcreteModel) {
        guard
            let view:UIView = model.view
        else {
            return
        }
        self.view.addSubview(view)
    }
}
