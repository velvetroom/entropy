import Foundation

internal final class ViewSimulation:View, ViewProtocol {
    internal typealias SpecialisedViewModel = ModelSimulation<ControllerSimulation>
    internal var viewModel:ModelSimulation<ControllerSimulation>?
    
    internal override func factoryViews() {
        super.factoryViews()
        self.viewModel?.shite()
    }
}
