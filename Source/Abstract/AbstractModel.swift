import Foundation

protocol AbstractModel:ViewModelDelegate, ControllerDelegate {
    var viewModel:AbstractViewModel { get }
    var controller:AbstractController { get }
    
    init()
}
