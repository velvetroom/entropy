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
    
    internal func present<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        strategy:PresentationStrategyProtocol.Type,
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>) {
        self.privateQueue.async { [weak self] in
            self?.presentQueued(strategy:strategy, model:model)
        }
    }
    
    private func presentQueued<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        strategy:PresentationStrategyProtocol.Type,
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>) {
        self.models.append(model)
        strategy.present(presenter:self, model:model)
    }
    
    internal func addController<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>) {
        guard
            let controller:UIViewController = model.controller as? UIViewController
        else {
            return
        }
        self.addChildViewController(controller)
    }
    
    internal func addView<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>) {
        guard
            let view:UIView = model.view
        else {
            return
        }
        self.view.addSubview(view)
    }
}
