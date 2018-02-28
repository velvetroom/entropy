import Foundation

internal protocol PresentationStrategyProtocol {
    static func present<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>(
        presenter:PresenterProtocol,
        model:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel>)
}
