import Foundation

internal final class SimulationController:Controller<SimulationViewModel> {
    internal override func loadView() {
        let view:SimulationView = SimulationView()
        self.view = view
    }
}
