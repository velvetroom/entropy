import Foundation

class SimulationViewModel:AbstractViewModel {
    weak var delegate:ViewModelDelegate?
    var content:SimulationViewModelContent
    private(set) var graph:SimulationViewModelGraph
    let menu:SimulationViewModelMenu
    
    required init() {
        self.graph = SimulationViewModelGraph()
        self.menu = SimulationViewModel.factoryMenu()
        self.content = self.menu.selectedItem.factoryViewModel()
    }
    
    func update(project:Project) {
        self.graph = SimulationViewModelGraph.factoryWithEntropy(entropy:project.entropy)
        self.menu.update(project:project)
        self.content.update(project:project)
    }
}
