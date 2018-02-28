import UIKit

internal protocol PresenterProtocol {
    weak var topController:UIViewController? { get }
    weak var topView:UIView? { get }
    
    func present<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        strategy:PresentationStrategyProtocol.Type,
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>)
    func addController<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>
        (model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>)
    func addView<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>)
}
