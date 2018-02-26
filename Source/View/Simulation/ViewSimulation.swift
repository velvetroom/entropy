import UIKit

internal final class ViewSimulation:View, ViewProtocol {
    internal typealias SpecialisedModel = ModelSimulation<ControllerSimulation>
    internal weak var model:ModelSimulation<ControllerSimulation>?
    
    internal override func factoryViews() {
        super.factoryViews()
        self.backgroundColor = UIColor.red
    }
}
