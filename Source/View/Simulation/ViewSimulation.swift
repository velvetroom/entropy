import Foundation

internal final class ViewSimulation:View, ViewProtocol {
    internal typealias SpecialisedModel = ModelSimulation<ControllerSimulation>
    internal var model:ModelSimulation<ControllerSimulation>?
    
    internal override func factoryViews() {
        super.factoryViews()
        self.model?.shite()
    }
}
