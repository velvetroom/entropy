import Foundation

internal protocol PresenterProtocol {
    func present<ConcreteController>(strategy:PresentationStrategyProtocol.Type, model:Model<ConcreteController>)
}
