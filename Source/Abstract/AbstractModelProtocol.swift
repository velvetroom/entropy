import Foundation

internal protocol AbstractModelProtocol {
    associatedtype ViewModel:AbstractViewModel
    var viewModel:ViewModel { get set }
    
    init()
}
