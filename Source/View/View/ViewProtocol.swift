import Foundation

internal protocol ViewProtocol {
    associatedtype SpecialisedViewModel
    var viewModel:SpecialisedViewModel? { get set }
    
    init()
    init(viewModel:SpecialisedViewModel)
    func factoryViews()
}
