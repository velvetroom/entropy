import Foundation

internal extension AbstractModelProtocol {
    internal static func factoryViewModel() -> AbstractViewModelProtocol {
        return Self.ViewModel()
    }
    
    internal static func factoryController(viewModel:AbstractViewModelProtocol) -> AbstractControllerPrototype {
        return Self.Controller(viewModel:viewModel)
    }
}
