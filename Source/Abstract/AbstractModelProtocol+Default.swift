import Foundation

internal extension AbstractModelProtocol {
    internal init() {
        self.viewModel = Self.ViewModel()
        self.controller = Self.Controller(viewModel:self.viewModel)
    }
}
