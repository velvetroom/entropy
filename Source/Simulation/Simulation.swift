import UIKit

internal final class Simulation:AbstractModel, ControllerDelegate {
    internal let viewModel:AbstractViewModel
    internal let controller:AbstractController
    
    internal init() {
        let viewModel:SimulationViewModel = SimulationViewModel()
        let controller:SimulationController = SimulationController()
        controller.viewModel = viewModel
        self.viewModel = viewModel
        self.controller = controller
        controller.delegate = self
    }
}
