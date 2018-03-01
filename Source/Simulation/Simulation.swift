import UIKit

internal final class Simulation:AbstractModelProtocol {
    typealias Controller = SimulationController
    
    internal typealias ViewModel = SimulationViewModel
    internal var viewModel:AbstractViewModelProtocol
    internal var controller:AbstractControllerPrototype
    
    internal init() {
        
    }
}
