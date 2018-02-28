import Foundation

internal protocol ViewProtocol:AnyObject {
    associatedtype SpecialisedViewModel:ViewModelProtocol
    weak var viewModel:SpecialisedViewModel? { get set }
    
    init()
    init(viewModel:SpecialisedViewModel)
    func factoryViews()
}
