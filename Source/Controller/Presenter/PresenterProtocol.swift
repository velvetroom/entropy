import UIKit

internal protocol PresenterProtocol {
    weak var topController:UIViewController? { get }
    weak var topView:UIView? { get }
    
    func present<ConcreteModel:ModelProtocol>(strategy:PresentationStrategyProtocol.Type, model:ConcreteModel)
    func addController<ConcreteModel:ModelProtocol>(model:ConcreteModel)
    func addView<ConcreteModel:ModelProtocol>(model:ConcreteModel)
}
