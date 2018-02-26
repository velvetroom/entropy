import Foundation

internal protocol PresenterProtocol {
    func present<ConcreteController>(strategy:PresentationStrategyProtocol.Type, model:Model<ConcreteController>)
    func addController<ConcreteController>(model:Model<ConcreteController>)
    func addView<ConcreteController>(model:Model<ConcreteController>)
}
