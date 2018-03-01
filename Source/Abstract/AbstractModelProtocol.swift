import Foundation

internal protocol AbstractModelProtocol:ViewModelDelegate {
    associatedtype ViewModel:AbstractViewModel
    var viewModel:ViewModel { get }
    
    init()
}
