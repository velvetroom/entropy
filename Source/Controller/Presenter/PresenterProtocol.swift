import UIKit

internal protocol PresenterProtocol {
    weak var topController:UIViewController? { get }
    weak var topView:UIView? { get }
    
    func present<ConcreteController>(strategy:PresentationStrategyProtocol.Type, model:Model<ConcreteController>)
    func addController<ConcreteController>(model:Model<ConcreteController>)
    func addView<ConcreteController>(model:Model<ConcreteController>)
}
