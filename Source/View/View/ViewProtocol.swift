import Foundation

internal protocol ViewProtocol {
    associatedtype ConcreteViewModel where ConcreteViewModel:ViewModelProtocol
    var viewModel:ConcreteViewModelProtocol? { get set }
    
    init()
    init(viewModel:ConcreteViewModelProtocol)
    func factoryViews()
}
