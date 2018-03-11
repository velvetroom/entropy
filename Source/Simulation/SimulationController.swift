import Foundation

class SimulationController:Controller<SimulationViewModel, SimulationView> {
    override func reloadViewModel() {
        self.specialisedView?.viewGraph?.viewModel = self.viewModel?.graph
        self.specialisedView?.viewGraph?.layoutIfNeeded()
    }
}
