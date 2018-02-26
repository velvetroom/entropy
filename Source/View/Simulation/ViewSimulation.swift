import UIKit

internal final class ViewSimulation:View, ViewProtocol {
    
    internal typealias SpecialisedModel = ModelSimulation<ControllerSimulation>
    internal weak var model:ModelSimulation<ControllerSimulation>?
    
    internal init(model:ModelSimulation<ControllerSimulation>) {
        super.init()
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    internal override func factoryViews() {
        super.factoryViews()
        self.backgroundColor = UIColor.red
    }
}
