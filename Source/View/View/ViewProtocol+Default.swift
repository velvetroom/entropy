import Foundation

internal extension ViewProtocol {
    internal init(model:ConcreteModel) {
        self.init()
        self.model = model
        self.factoryViews()
    }
}
