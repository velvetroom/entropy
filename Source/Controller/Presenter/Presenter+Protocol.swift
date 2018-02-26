import Foundation

internal extension Presenter {
    internal func present<ConcreteController>(strategy:PresentationStrategyProtocol,
                                              model:Model<ConcreteController>) {
    }
}
