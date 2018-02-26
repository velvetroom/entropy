import Foundation

internal protocol PresentationStrategyProtocol {
    static func present<ConcreteController>(presenter:Presenter, model:Model<ConcreteController>)
}
