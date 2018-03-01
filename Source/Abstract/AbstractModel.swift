import Foundation

internal protocol AbstractModel:ViewModelDelegate {
    var viewModel:AbstractViewModelProtocol { get }
    var controller:AbstractControllerPrototype { get }
}
