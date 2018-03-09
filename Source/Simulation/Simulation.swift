import Foundation

class Simulation:Model {
    var project:Project?
    
    required init() {
        let viewModel:SimulationViewModel = SimulationViewModel()
        let controller:SimulationController = SimulationController()
        super.init(viewModel:viewModel, controller:controller)
    }
    
    func loadProject(completion:@escaping(() -> ())) {
        
    }
    
    func updateViewModel() {
        
    }
}
