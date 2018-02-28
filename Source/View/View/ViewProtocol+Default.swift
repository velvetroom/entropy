import Foundation

internal extension ViewProtocol {
    internal init(viewModel:ConcreteViewModel) {
        self.init()
        self.viewModel = viewModel
        self.factoryViews()
    }
}
