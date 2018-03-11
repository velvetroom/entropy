import Foundation

class SimulationController:Controller<SimulationViewModel, SimulationView> {
    override func reloadViewModel() {
        guard
            let viewModel:SimulationViewModel = self.viewModel
        else {
            return
        }
        self.specialisedView?.viewGraph?.updateViewModel(viewModel:viewModel.graph)
    }
}
