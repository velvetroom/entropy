import Foundation

internal protocol PresenterProtocol {
    func present<ConcreteController>(strategy:PresentationStrategyProtocol, model:Model<ConcreteController>)
}
