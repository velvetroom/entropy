import Foundation

internal final class ViewSimulation:View, ViewProtocol {
    internal typealias ConcreteModel = Simulation<ControllerSimulation>
    internal weak var model:Simulation<ControllerSimulation>?
    
    internal override func factoryViews() {
        super.factoryViews()
        self.model?.shite()
    }
}
