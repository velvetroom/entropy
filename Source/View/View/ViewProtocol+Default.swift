import Foundation

internal extension ViewProtocol {
    internal init(viewModel:SpecialisedViewModel) {
        self.init()
        self.viewModel = viewModel
        self.factoryViews()
    }
}
