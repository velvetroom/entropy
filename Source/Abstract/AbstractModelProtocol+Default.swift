import Foundation

internal extension AbstractModelProtocol {
    internal init() {
        self.viewModel = Self.ViewModel()
    }
}
