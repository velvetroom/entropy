import Foundation

internal final class ViewSimulation:View, ViewProtocol {
    internal typealias ConcreteModel = ModelSimulation<ControllerSimulation>
    internal weak var model:ModelSimulation<ControllerSimulation>?
    
    internal override func factoryViews() {
        super.factoryViews()
        self.model?.shite()
    }
}
