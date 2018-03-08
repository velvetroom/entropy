import Foundation

internal final class Simulation:Model {
    internal var project:Project?
    
    required init() {
        let viewModel:SimulationViewModel = SimulationViewModel()
        let controller:SimulationController = SimulationController()
        super.init(viewModel:viewModel, controller:controller)
    }
    
    internal func loadProject(completion:@escaping(() -> ())) {
        
    }
    
    internal func updateViewModel() {
        
    }
}
