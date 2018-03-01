import Foundation

internal extension AbstractModelProtocol {
    internal init() {
        self.viewModel = Self.ViewModel()
        self.viewController = Self.ViewController(viewModel:self.viewModel)
    }
}
