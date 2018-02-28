import Foundation

internal final class ViewSimulation:View, ViewProtocol {
    internal typealias ConcreteModel =
        Simulation<ControllerSimulation, SimulationControllerDelegate, SimulationViewModel>
    internal weak var model:ConcreteModel?
    
    internal override func factoryViews() {
        super.factoryViews()
        self.model?.shite()
    }
}
