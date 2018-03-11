import Foundation

class SimulationViewModel:AbstractViewModel {
    weak var delegate:ViewModelDelegate?
    private(set) var graph:SimulationViewModelGraph
    let menu:[SimulationViewModelMenuProtocol]
    
    required init() {
        self.graph = SimulationViewModelGraph()
        self.menu = SimulationViewModel.factoryMenu()
    }
    
    func updateGraph(entropy:Entropy) {
        self.graph = SimulationViewModelGraph.factoryWithEntropy(entropy:entropy)
    }
}
