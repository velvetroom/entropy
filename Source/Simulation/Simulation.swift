import Foundation

internal final class Simulation:Model {
    required init() {
        let viewModel:SimulationViewModel = SimulationViewModel()
        let controller:SimulationController = SimulationController()
        super.init(viewModel:viewModel, controller:controller)
    }
    
    
}
