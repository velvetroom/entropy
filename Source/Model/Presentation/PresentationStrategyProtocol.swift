import Foundation

internal protocol PresentationStrategyProtocol {
    static func present<ConcreteController>(presenter:PresenterProtocol, model:Model<ConcreteController>)
}
