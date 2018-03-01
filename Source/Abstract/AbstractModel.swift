import Foundation

internal protocol AbstractModel:ViewModelDelegate {
    var viewModel:AbstractViewModel { get }
    var controller:AbstractController { get }
    
    init()
}
