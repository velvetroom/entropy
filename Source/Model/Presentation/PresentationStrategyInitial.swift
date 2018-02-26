import Foundation

internal final class PresentationStrategyInitial:PresentationStrategyProtocol {
    internal static func present<ConcreteController>(presenter:PresenterProtocol, model:Model<ConcreteController>) {
        presenter.addController(model:model)
    }
}
