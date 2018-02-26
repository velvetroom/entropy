import Foundation

internal final class PresentationStrategyInitial:PresentationStrategyProtocol {
    internal static func present<ConcreteController>(presenter:Presenter, model:Model<ConcreteController>) {
    }
}
