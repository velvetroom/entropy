import UIKit

internal final class Simulation:AbstractModelProtocol {
    typealias Controller = SimulationController
    
    internal typealias ViewModel = SimulationViewModel
    internal var viewModel:AbstractViewModel
    internal var controller:AbstractController
    
    internal init() {
        
    }
}
