import Foundation

internal extension ViewProtocol {
    internal init(viewModel:ConcreteViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.factoryViews()
    }
}
