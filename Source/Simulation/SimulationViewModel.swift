import Foundation

class SimulationViewModel:AbstractViewModel {
    weak var delegate:ViewModelDelegate?
    private(set) var graph:SimulationViewModelGraph
    
    required init() {
        self.graph = SimulationViewModelGraph.factoryFullProductivity()
    }
}
