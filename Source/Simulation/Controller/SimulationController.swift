import Foundation

class SimulationController:Controller<SimulationViewModel, SimulationView> {
    private let graph:SimulationControllerGraph
    private let scroll:SimulationControllerScroll
    
    override init() {
        self.graph = SimulationControllerGraph()
        self.scroll = SimulationControllerScroll()
        super.init()
    }
    
    override func reloadViewModel() {
        guard
            let viewModel:SimulationViewModel = self.viewModel
        else {
            return
        }
        self.specialisedView?.viewGraph?.updateViewModel(viewModel:viewModel.graph)
    }
}
