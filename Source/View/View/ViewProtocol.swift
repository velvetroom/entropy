import Foundation

internal protocol ViewProtocol {
    associatedtype ConcreteViewModel:ViewModelProtocol
    weak var viewModel:ConcreteViewModel? { get set }
    
    init()
    init(viewModel:ConcreteViewModel)
    func factoryViews()
}
