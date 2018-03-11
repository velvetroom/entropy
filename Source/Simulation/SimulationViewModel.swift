import Foundation

class SimulationViewModel:AbstractViewModel {
    weak var delegate:ViewModelDelegate?
    private(set) var graph:SimulationViewModelGraph
    
    required init() {
        self.graph = SimulationViewModelGraph()
    }
    
    func updateGraph(entropy:Entropy) {
        self.graph = SimulationViewModelGraph.factoryWithEntropy(entropy:entropy)
    }
}
